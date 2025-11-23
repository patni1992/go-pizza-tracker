package main

import (
	"log/slog"
	"os"
	"pizza-tracker-go/internal/models"

	"github.com/gin-gonic/gin"
)

func main() {
	cfg := loadConfig()

	logger := slog.New(slog.NewTextHandler(os.Stdout, nil))
	slog.SetDefault(logger)

	dbModel, err := models.InitDB(cfg.DBPath)
	if err != nil {
		slog.Error("Failed to initialized database", "error", err)
		os.Exit(1)
	}

	slog.Info("Database initialized successfully")

	RegisterCustomValidators()

	h := NewHandler(dbModel)

	router := gin.Default()

	if err := loadTemplates(router); err != nil {
		slog.Error("Failed to load templates", "error", err)
		os.Exit(1)
	}

	sessionStore := setupSessionStore(dbModel.DB, []byte(cfg.SessionSecretKey))

	setupRoutes(router, h, sessionStore)

	slog.Info("Server starting", "url", "http://localhost:"+cfg.Port)

	router.Run(":" + cfg.Port)
}
