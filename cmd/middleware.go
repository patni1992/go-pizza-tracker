package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func (h *Handler) AuthMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		userID := GetSessionString(c, "userID")

		if userID == "" {
			c.Redirect(http.StatusSeeOther, "/login")
			c.Abort()
			return
		}

		_, err := h.users.GetUserByID(userID)
		if err != nil {
			ClearSession(c)
			c.Redirect(http.StatusSeeOther, "/login")
			c.Abort()
			return
		}

		c.Next()
	}
}
