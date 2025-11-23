package main

import (
	"io"
	"log/slog"

	"github.com/gin-gonic/gin"
)

func (h *Handler) notificationHandler(c *gin.Context) {
	orderID := c.Query("orderId")

	if orderID == "" {
		c.String(400, "Invalid orderId")
		return
	}

	_, err := h.orders.GetOrder(orderID)
	if err != nil {
		c.String(404, "Order not found")
		return
	}

	key := "order:" + orderID
	client := make(chan string, 10)
	h.notificationManager.AddClient(key, client)

	defer func() {
		h.notificationManager.RemoveClient(key, client)
		slog.Info("Customer client disconnected", "orderId", orderID)
	}()

	h.streamSSE(c, client)
}

func (h *Handler) adminNotificationHandler(c *gin.Context) {
	key := "admin:new_orders"
	client := make(chan string, 10)
	h.notificationManager.AddClient(key, client)

	defer func() {
		h.notificationManager.RemoveClient(key, client)
		slog.Info("Admin client  disconnected")
	}()

	h.streamSSE(c, client)
}

func (h *Handler) streamSSE(c *gin.Context, client chan string) {
	c.Header("Content-Type", "text/event-stream")
	c.Header("Cache-Control", "no-cache")
	c.Header("Connection", "keep-alive")

	c.Stream(func(w io.Writer) bool {
		if msg, ok := <-client; ok {
			c.SSEvent("message", msg)
			return true
		}
		return false
	})
}
