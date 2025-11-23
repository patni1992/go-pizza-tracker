package main

import (
	"github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
)

func setupRoutes(router *gin.Engine, h *Handler, store sessions.Store) {
	router.Use(sessions.Sessions("pizza-tracker", store))
	router.GET("/", h.ServeNewOrderForm)
	router.POST("/new-order", h.HandleNewOrderPost)
	router.GET("/customer/:id", h.serveCustomer)
	router.GET("/notifications", h.notificationHandler)

	router.GET("/login", h.HandleLoginGet)
	router.POST("/login", h.HandleLoginPost)
	router.POST("/logout", h.HandleLogout)

	admin := router.Group("/admin")
	admin.Use(h.AuthMiddleware())
	{
		admin.GET("", h.ServeAdminDashboard)
		admin.POST("/order/:id/update", h.HandleOrderPut)
		admin.POST("/order/:id/delete", h.HandleOrderDelete)
		admin.GET("/notifications", h.adminNotificationHandler)
	}

	router.Static("/static", "./templates/static")
}
