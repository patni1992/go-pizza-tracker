-- -------------------------------------------------------------
-- TablePlus 6.7.4(642)
--
-- https://tableplus.com/
--
-- Database: dev.db
-- Generation Time: 2025-11-22 21:58:13.8130
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "User";
CREATE TABLE "User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT,
    "email" TEXT NOT NULL,
    "emailVerified" DATETIME,
    "image" TEXT,
    "subscriptionStatus" TEXT NOT NULL DEFAULT 'FREE',
    "stripeCustomerId" TEXT,
    "stripeSubscriptionId" TEXT,
    "subscriptionEndsAt" DATETIME,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

DROP TABLE IF EXISTS "Account";
CREATE TABLE "Account" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "userId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "providerAccountId" TEXT NOT NULL,
    "refresh_token" TEXT,
    "access_token" TEXT,
    "expires_at" INTEGER,
    "token_type" TEXT,
    "scope" TEXT,
    "id_token" TEXT,
    "session_state" TEXT,
    CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS "Session";
CREATE TABLE "Session" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "sessionToken" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "expires" DATETIME NOT NULL,
    CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS "VerificationToken";
CREATE TABLE "VerificationToken" (
    "identifier" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" DATETIME NOT NULL
);

DROP TABLE IF EXISTS "Order";
CREATE TABLE "Order" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "userId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "stripeSessionId" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'pending',
    "amount" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Order_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Order_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

DROP TABLE IF EXISTS "Product";
CREATE TABLE "Product" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "slug" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "icon" TEXT NOT NULL DEFAULT 'NONE',
    "youtubeUrl" TEXT,
    "imageUrl" TEXT,
    "thumbnailUrl" TEXT,
    "fileUrl" TEXT,
    "salesCopy" TEXT,
    "content" TEXT,
    "features" TEXT,
    "curriculum" TEXT,
    "showToc" BOOLEAN NOT NULL DEFAULT false,
    "ctaTitle" TEXT NOT NULL DEFAULT 'Ready to get started?',
    "ctaDescription" TEXT NOT NULL DEFAULT 'Get instant access to all content and downloads',
    "ctaText" TEXT NOT NULL DEFAULT 'Buy Now',
    "active" BOOLEAN NOT NULL DEFAULT true,
    "featured" BOOLEAN NOT NULL DEFAULT false,
    "comingSoon" BOOLEAN NOT NULL DEFAULT false,
    "hidden" BOOLEAN NOT NULL DEFAULT false,
    "order" INTEGER NOT NULL DEFAULT 0,
    "publishDate" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metaTitle" TEXT,
    "metaDescription" TEXT,
    "keywords" TEXT,
    "author" TEXT,
    "ogImageUrl" TEXT,
    "canonicalUrl" TEXT,
    "noIndex" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

INSERT INTO "User" ("id", "name", "email", "emailVerified", "image", "subscriptionStatus", "stripeCustomerId", "stripeSubscriptionId", "subscriptionEndsAt", "createdAt", "updatedAt") VALUES
('cmgdkoo6w0003ityi885bntfd', NULL, 'admin@test.com', '1763814534375', NULL, 'FREE', NULL, NULL, NULL, '1759660931193', '1763814534375'),
('cmgm6j9fh0000y44v4jdkufk7', NULL, 'admin@example.com', '1760181359740', NULL, 'FREE', NULL, NULL, NULL, '1760181359742', '1760181359742'),
('cmgp4rrx70000y4j11r2iy2c5', NULL, 'customer@gocommerce.com', '1760364164262', NULL, 'FREE', NULL, NULL, NULL, '1760359796251', '1760364164263'),
('cmgp6i5ym0006y46gxnz12mq4', NULL, 'test@codingwithpatrik.dev', '1760362707118', NULL, 'FREE', NULL, NULL, NULL, '1760362707119', '1760362707119'),
('cmgp8mmsj000cy4r2i4b3vfj2', NULL, 'patriknilsson1992@gmail.com', '1760366274787', NULL, 'FREE', NULL, NULL, NULL, '1760366274788', '1760366274788'),
('cmgxjhiob0002y40ae3w67cln', NULL, 'helloman@gmail.com', '1760868241355', NULL, 'FREE', NULL, NULL, NULL, '1760868241355', '1760868241355'),
('cmgxmn1cu0009y40a49nd584f', NULL, 'bob@hotmail.com', '1760873537693', NULL, 'FREE', NULL, NULL, NULL, '1760873537694', '1760873537694');

INSERT INTO "Session" ("id", "sessionToken", "userId", "expires") VALUES
('cmge7mtx8000199mlcxy0yraf', '5972d5ad-5f99-403d-92b3-2a2777c2d46f', 'cmgdkoo6w0003ityi885bntfd', '1762672799652'),
('cmgm6jsy80004y44vwmmrt6eu', '0ac678ba-ffce-43d9-844c-a86cf936dfff', 'cmgdkoo6w0003ityi885bntfd', '1762773385040'),
('cmgmaw1rt0001y4nj88075814', 'bf0c260e-2ce7-40c1-adcd-dc2ddc21be99', 'cmgdkoo6w0003ityi885bntfd', '1762780674808'),
('cmgp6hl9o0005y46g19k7059e', 'e22130ea-e7c4-49f2-ae99-8788ce0a36cf', 'cmgdkoo6w0003ityi885bntfd', '1762954680300'),
('cmgp6j716000ay46gh8nleptw', '6685fd4b-0bc6-4b9d-9e67-a4dc5e0683aa', 'cmgdkoo6w0003ityi885bntfd', '1762954755162'),
('cmgp6kyfk0001y4r2xa4kwcm3', '61809371-2a19-42e7-830e-c5f9249ff37b', 'cmgdkoo6w0003ityi885bntfd', '1762954837328'),
('cmgp6lsks0003y4r21snju79l', 'dea6c790-999c-4ad5-94e1-8170e975324e', 'cmgdkoo6w0003ityi885bntfd', '1762954876396'),
('cmgp95a9x000iy4r2pdhcjo6o', 'd8ed7fab-9ba5-4b2c-a199-6c5b009d4aba', 'cmgdkoo6w0003ityi885bntfd', '1763139792384'),
('cmia9msx40001y4qel6oio6uo', '9fdb66aa-ac84-41ed-b7eb-24323a32a260', 'cmgdkoo6w0003ityi885bntfd', '1766406534376');

INSERT INTO "VerificationToken" ("identifier", "token", "expires") VALUES
('sdkfksdfksdkf@niin.com', '581e4f48627d5a911562ee696b6eaea437a92ad9a98ffc0bf8ff0136e401033f', '1760357747589'),
('customer@gocommerce.com', '3bce907e3f4d6b5ffbeec95598c366a41ff3f2751b217f601adb00ded3446d2a', '1760450400533'),
('helloman@gmail.com', '81fedc90bf19b1c0a9e219b9fa235dc739115f9219dd65471f2ae2bbb34c986b', '1763900329961');

INSERT INTO "Product" ("id", "slug", "name", "description", "price", "icon", "youtubeUrl", "imageUrl", "thumbnailUrl", "fileUrl", "salesCopy", "content", "features", "curriculum", "showToc", "ctaTitle", "ctaDescription", "ctaText", "active", "featured", "comingSoon", "hidden", "order", "publishDate", "metaTitle", "metaDescription", "keywords", "author", "ogImageUrl", "canonicalUrl", "noIndex", "createdAt", "updatedAt") VALUES
('cmge7nn27000299ml6w6r25hn', 'pizza-app-go-gin-gorm-fullstack', 'Build a Full-Stack Pizza Tracker with Go Golang | Real-Time Updates (Gin, GORM, SSE) Admin Dashboard', 'Learn how to build a real-time pizza order tracker with Go Golang, Gin, Gorm, and more. This step-by-step tutorial covers everything from project setup to live updates and admin dashboard. Follow along and build your own full-stack application!', '0', 'NONE', NULL, '/images/PIZZA TRACK IN GO.png', NULL, NULL, 'sales page', '# Build a Real-Time Pizza Tracker with Go, Gin, and Server-Sent Events

You''ll build a complete pizza ordering and tracking system where customers can place orders through a web form, track their order status in real-time, and admins can manage orders through a dashboard. The app uses Server-Sent Events (SSE) to push updates automatically without page refreshes.

By the end of this tutorial, you''ll have a production-ready web app with authentication, real-time notifications, form validation, and a SQLite database.

## What You''ll Build

**Customer Features:**

- Order form with dynamic pizza selection
- Real-time order tracking page with status visualization
- Automatic updates when order status changes

**Admin Features:**

- Login with bcrypt password hashing
- Dashboard showing all orders
- Update order status with real-time notifications
- Delete orders

**Technical Stack:**

- **Gin** - Fast HTTP web framework
- **GORM** - Database ORM with SQLite
- **Gin Sessions** - GORM-backed session storage
- **Server-Sent Events** - Real-time push notifications
- **Tailwind CSS** - Styling (via CDN)

![Pizza Tracker App Overview](docs/images/app-overview.png)
_The complete pizza tracker app showing the customer order form, tracking page, and admin dashboard_

## Project Setup

Create the project structure:

```bash
mkdir pizza-tracker && cd pizza-tracker
go mod init pizza-tracker-go-demo
mkdir -p cmd internal/models templates/static data
```

This creates separate directories for application code (`cmd`), database models (`internal/models`), HTML templates (`templates`), and the SQLite database (`data`). The `go mod init` command creates a `go.mod` file to track dependencies.

## Dependencies

This project uses the following packages. When you run `go mod tidy` later, it will automatically detect these imports in your code and add them to `go.mod` with the correct versions.

**What each dependency does:**

- **Gin** (`github.com/gin-gonic/gin`) - Fast HTTP web framework with routing, middleware, and template rendering
- **GORM** (`gorm.io/gorm` and `gorm.io/driver/sqlite`) - ORM that lets you work with databases using Go structs instead of SQL
- **Gin Sessions** (`github.com/gin-contrib/sessions`) - Session middleware for Gin with pluggable backends
- **GORM Store** (`github.com/wader/gormstore/v2`) - GORM-backed session storage that persists sessions to SQLite
- **Bcrypt** (`golang.org/x/crypto/bcrypt`) - Password hashing algorithm that''s intentionally slow to prevent brute-force attacks
- **Validator** (`github.com/go-playground/validator/v10`) - Validates form input using struct tags
- **ShortID** (`github.com/teris-io/shortid`) - Generates short, unique IDs for orders (like "aBc123XyZ")

## Submit Pizza Order

By the end of this section, customers will be able to fill out a form, select multiple pizzas with sizes and types, submit their order, and see a confirmation with their order ID. This is the foundation of everything - you need to be able to create orders before you can track them or manage them.

We''ll build the order database model, create an HTML form with dynamic pizza fields, write custom validators to ensure pizza types and sizes are valid, and implement handlers that save orders to the database.

### Order Database Model

We need models to represent orders in the database. An order contains customer information (name, phone, address) and a list of pizzas with their sizes, types, and special instructions.

Create `internal/models/order.go`:

```go
package models

import (
	"time"

	"github.com/teris-io/shortid"
	"gorm.io/gorm"
)

var (
	OrderStatuses = []string{"Order Placed", "Preparing", "Baking", "Quality Check", "Ready"}

	PizzaTypes = []string{
		"Margherita",
		"Pepperoni",
		"Vegetarian",
		"Hawaiian",
		"Bbq Chicken",
		"Meat Lovers",
		"Buffalo Chicken",
		"Supreme",
		"Truffle Mushroom",
		"Four Cheese",
	}

	PizzaSizes = []string{"Small", "Medium", "Large", "X-Large"}
)

type OrderModel struct {
	DB *gorm.DB
}

type Order struct {
	ID           string      `gorm:"primaryKey;size:14" json:"id"`
	Status       string      `gorm:"not null" json:"status"`
	CustomerName string      `gorm:"not null" json:"customer_name"`
	Phone        string      `gorm:"not null" json:"phone"`
	Address      string      `gorm:"not null" json:"address"`
	Items        []OrderItem `gorm:"foreignKey:OrderID" json:"pizzas"`
	CreatedAt    time.Time   `json:"created_at"`
}

type OrderItem struct {
	ID           string `gorm:"primaryKey;size:14" json:"id"`
	OrderID      string `gorm:"index;size:14;not null" json:"order_id"`
	Size         string `gorm:"not null" json:"size" form:"size" binding:"required"`
	Pizza        string `gorm:"not null" json:"pizza" form:"pizza" binding:"required"`
	Instructions string `json:"instructions" form:"instructions"`
}

func (o *Order) BeforeCreate(tx *gorm.DB) error {
	if o.ID == "" {
		o.ID = shortid.MustGenerate()
	}
	return nil
}

func (oi *OrderItem) BeforeCreate(tx *gorm.DB) error {
	if oi.ID == "" {
		oi.ID = shortid.MustGenerate()
	}
	return nil
}

func (o *OrderModel) CreateOrder(order *Order) error {
	return o.DB.Create(order).Error
}

func (o *OrderModel) GetOrder(id string) (*Order, error) {
	var order Order
	err := o.DB.Preload("Items").First(&order, "id = ?", id).Error
	return &order, err
}
```

**Order and OrderItem structs:** These define the database schema. The `Order` has customer details and a slice of `OrderItem` (the pizzas). GORM struct tags like `gorm:"primaryKey"` and `gorm:"foreignKey:OrderID"` tell GORM how to create the database tables and relationships.

**BeforeCreate hooks:** GORM calls these functions automatically before inserting records. They generate short, unique IDs like "aBc123XyZ" instead of sequential integers. This makes order IDs easy to type and share.

**OrderModel methods:** These provide a clean API for database operations. `CreateOrder` saves an order and all its pizzas in one transaction. `GetOrder` uses `Preload("Items")` to fetch related pizzas when loading an order - without this, the `Items` slice would be empty.

**Why separate Order and OrderItem:** This database design follows normalization principles. Customer info lives in the Order table once, while each pizza is a separate row in the OrderItem table. This prevents data duplication and makes queries efficient.

### Database Connection Setup

We need a central place to initialize the database connection. This file sets up the database, runs migrations to create tables, and provides our order model for use throughout the application.

Create `internal/models/models.go`:

```go
package models

import (
	"fmt"

	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

type DBModel struct {
	Order OrderModel
}

func InitDB(dataSourceName string) (*DBModel, error) {
	db, err := gorm.Open(sqlite.Open(dataSourceName), &gorm.Config{})
	if err != nil {
		return nil, fmt.Errorf("failed to connect to database: %v", err)
	}

	err = db.AutoMigrate(&Order{}, &OrderItem{})
	if err != nil {
		return nil, fmt.Errorf("failed to migrate database: %v", err)
	}

	dbModel := &DBModel{
		Order: OrderModel{DB: db},
	}

	return dbModel, nil
}
```

**DBModel struct:** This acts as a container for our database models. Right now we only have Order, but we''ll add more models later (User, Session). This design makes it easy to pass all database access through a single object.

**InitDB function:** Opens a connection to the SQLite database at the path you provide, runs AutoMigrate to create or update tables, and returns a DBModel with the order model ready to use.

**AutoMigrate:** GORM reads the struct tags in your Order and OrderItem structs and automatically creates database tables to match. If you add a new field to a struct later, AutoMigrate updates the table schema. It''s like having a database admin that reads your Go code and keeps the database in sync.

**Why pass the database path as a parameter:** This lets us use different database paths for development (`./data/orders.db`) and production (`/data/orders.db` on Railway). Configuration flexibility like this is crucial for real applications.

### Custom Form Validators

Gin''s built-in validation can check if fields are required or have minimum length, but we need custom validators to ensure pizza types and sizes match our predefined lists.

Create `cmd/validators.go`:

```go
package main

import (
	"pizza-tracker-go-demo/internal/models"
	"slices"

	"github.com/gin-gonic/gin/binding"
	"github.com/go-playground/validator/v10"
)

func RegisterCustomValidators() {
	if v, ok := binding.Validator.Engine().(*validator.Validate); ok {
		v.RegisterValidation("valid_pizza_type", createSliceValidator(models.PizzaTypes))
		v.RegisterValidation("valid_pizza_size", createSliceValidator(models.PizzaSizes))
	}
}

func createSliceValidator(allowedValues []string) validator.Func {
	return func(fl validator.FieldLevel) bool {
		return slices.Contains(allowedValues, fl.Field().String())
	}
}
```

**RegisterCustomValidators function:** This registers two custom validation rules with Gin''s validator. You''ll call this once during application startup.

**createSliceValidator helper:** This creates a validator function that checks if a value exists in a predefined slice. It''s reusable - we use it for both pizza types and sizes.

**Why custom validators:** Without these, someone could submit the form with `pizza=InvalidPizza&size=Enormous` and bypass your validation. Custom validators ensure only valid values from your predefined lists are accepted.

### Handler Structure

Instead of passing database connections and other dependencies to every handler function separately, we''ll bundle them once in a struct. This makes the code cleaner and easier to extend later.

Create `cmd/handlers.go`:

```go
package main

import (
	"pizza-tracker-go-demo/internal/models"
)

// Handler holds all dependencies for HTTP handlers
type Handler struct {
	orders *models.OrderModel
}

func NewHandler(dbModel *models.DBModel) *Handler {
	return &Handler{
		orders: &dbModel.Order,
	}
}
```

**Handler struct:** This bundles all the dependencies your handlers need. Right now it''s just the order model, but we''ll add session managers, user models, and notification systems in later features. Each handler method can access these without receiving them as parameters every time.

**Why use a constructor function:** The `NewHandler` function creates and initializes the Handler struct. This pattern is common in Go and ensures all dependencies are properly set up before use.

### Customer Order Handlers

Now we''ll create the handlers that display the order form and process submissions.

Create `cmd/customer.go`:

```go
package main

import (
	"log/slog"
	"net/http"
	"pizza-tracker-go-demo/internal/models"

	"github.com/gin-gonic/gin"
)

type OrderFormData struct {
	PizzaTypes []string
	PizzaSizes []string
}

type OrderRequest struct {
	Name         string   `form:"name" binding:"required,min=2,max=100"`
	Phone        string   `form:"phone" binding:"required,min=10,max=20"`
	Address      string   `form:"address" binding:"required,min=5,max=200"`
	Sizes        []string `form:"size" binding:"dive,valid_pizza_size"`
	PizzaTypes   []string `form:"pizza" binding:"dive,valid_pizza_type"`
	Instructions []string `form:"instructions" binding:"max=200"`
}

func (h *Handler) ServeNewOrderForm(c *gin.Context) {
	c.HTML(http.StatusOK, "order.tmpl", OrderFormData{
		PizzaTypes: models.PizzaTypes,
		PizzaSizes: models.PizzaSizes,
	})
}

func (h *Handler) HandleNewOrderPost(c *gin.Context) {
	var form OrderRequest

	if err := c.ShouldBind(&form); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	orderItems := make([]models.OrderItem, len(form.Sizes))
	for i := range orderItems {
		orderItems[i] = models.OrderItem{
			Size:         form.Sizes[i],
			Pizza:        form.PizzaTypes[i],
			Instructions: form.Instructions[i],
		}
	}

	order := models.Order{
		CustomerName: form.Name,
		Phone:        form.Phone,
		Address:      form.Address,
		Status:       models.OrderStatuses[0], // "Order Placed"
		Items:        orderItems,
	}

	if err := h.orders.CreateOrder(&order); err != nil {
		slog.Error("Failed to create order", "error", err)
		c.String(http.StatusInternalServerError, err.Error())
		return
	}

	slog.Info("Order created", "order_id", order.ID, "customer", order.CustomerName)

	c.Redirect(http.StatusSeeOther, "/customer/"+order.ID)
}

func (h *Handler) ServeCustomer(c *gin.Context) {
	orderID := c.Param("id")
	if orderID == "" {
		c.String(http.StatusBadRequest, "Order ID is required")
		return
	}

	order, err := h.orders.GetOrder(orderID)
	if err != nil {
		c.String(http.StatusNotFound, "Order not found")
		return
	}

	c.HTML(http.StatusOK, "customer.tmpl", gin.H{
		"Order": order,
	})
}
```

**OrderRequest struct:** This defines the shape of form data with validation rules. The `binding:"dive,valid_pizza_size"` tag tells the validator to validate each element in the slice using our custom validator. `ShouldBind` parses the form, validates every field, and returns errors if anything fails.

**ServeNewOrderForm handler:** Renders the order form template and passes the lists of pizza types and sizes for the dropdown menus.

**HandleNewOrderPost handler:** This is where the magic happens. `ShouldBind` parses the form data and runs all validations. If validation passes, we create an Order with all its OrderItems, save it to the database, and redirects to the customer tracking page.

**ServeCustomer handler:** Fetches the order from the database and renders the customer template. For now, the template will just show a simple success message. In this section, we''ll expand it to show the full tracking interface with progress bars and order details.

### Configuration and Template Loading

We need helper functions to load configuration from environment variables and parse HTML templates.

Create `cmd/utils.go`:

```go
package main

import (
	"html/template"
	"os"

	"github.com/gin-gonic/gin"
)

// Config holds all application configuration
type Config struct {
	Port   string
	DBPath string
}

func loadConfig() Config {
	return Config{
		Port:   getEnv("PORT", "8080"),
		DBPath: getEnv("DATABASE_URL", "./data/orders.db"),
	}
}

func getEnv(key, defaultValue string) string {
	if value := os.Getenv(key); value != "" {
		return value
	}
	return defaultValue
}

func loadTemplates(router *gin.Engine) error {
	functions := template.FuncMap{
		"add": func(a, b int) int { return a + b },
	}

	tmpl, err := template.New("").Funcs(functions).ParseGlob("templates/*.tmpl")
	if err != nil {
		return err
	}

	router.SetHTMLTemplate(tmpl)
	return nil
}
```

**Config struct:** Holds configuration like server port and database path. We read these from environment variables with fallback defaults.

**loadTemplates function:** Parses all `.tmpl` files in the templates directory and registers custom template functions. The `add` function lets us do `{{add $index 1}}` to display "Pizza #1" instead of "Pizza #0" in templates.

### Routes Setup

Now we''ll wire up the routes. This file maps URL paths to handler functions. For order submission, we only need three routes: the order form, order submission, and static files.

Create `cmd/routes.go`:

```go
package main

import (
	"github.com/gin-gonic/gin"
)

func setupRoutes(router *gin.Engine, h *Handler) {
	// Customer routes
	router.GET("/", h.ServeNewOrderForm)
	router.POST("/new-order", h.HandleNewOrderPost)
	router.GET("/customer/:id", h.ServeCustomer)

	// Static files
	router.Static("/static", "./templates/static")
}
```

**Simple route setup:** We map the root path `/` to the order form, `/new-order` to the submission handler, `/customer/:id` to the tracking page, and `/static` to serve static files. This is all we need for creating and viewing orders.

**Why keep it minimal:** We''ll add more routes in later features (login in the Admin Login section, admin dashboard in the Admin Dashboard section, SSE in the Real-Time Updates section). Starting simple makes the code easier to understand and test.

### Main Application Entry Point

The main function ties everything together - initializes the database, registers validators, loads templates, sets up routes, and starts the server.

Create `cmd/main.go`:

```go
package main

import (
	"log/slog"
	"os"
	"pizza-tracker-go-demo/internal/models"

	"github.com/gin-gonic/gin"
)

func main() {
	cfg := loadConfig()

	logger := slog.New(slog.NewTextHandler(os.Stdout, nil))
	slog.SetDefault(logger)

	dbModel, err := models.InitDB(cfg.DBPath)
	if err != nil {
		slog.Error("Failed to initialize database", "error", err)
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

	setupRoutes(router, h)

	slog.Info("Server starting", "url", "http://localhost:"+cfg.Port)

	router.Run(":" + cfg.Port)
}
```

**Structured logging:** `slog` is Go''s standard library structured logger. It outputs logs with key-value pairs like `"order_id", order.ID` instead of string concatenation. This makes logs easier to parse and search in production.

**Initialization order:** We set up the database first (since handlers need it), then register validators, create the handler struct, load templates, set up routes, and finally start the server. This order ensures everything is ready before the first request arrives.

**Why call RegisterCustomValidators:** This registers our custom pizza validators with Gin''s validation engine before any requests come in. If we skip this, form validation will fail because the validator doesn''t know about `valid_pizza_type` or `valid_pizza_size`.

### Order Form Template

Customers need a clean, modern form to place orders. This template uses Tailwind CSS for styling and JavaScript to dynamically add/remove pizza fields.

Create `templates/base.tmpl`:

```html
{{define "top"}}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
{{end}}

{{define "bottom"}}
</body>
</html>
{{end}}
```

**Template structure:** Go templates use `{{define "name"}}` blocks to create reusable template sections. We''ll use `{{template "top" .}}` and `{{template "bottom" .}}` in other templates to wrap content with consistent HTML structure.

Create `templates/order.tmpl`:

```html
{{template "top" .}}
    <title>New Pizza Order</title>
</head>
<body class="bg-gradient-to-br from-amber-50 via-orange-50 to-rose-50 min-h-screen">
<div class="flex items-center justify-center p-6 md:p-8">
  <div class="bg-white/80 backdrop-blur-sm p-8 md:p-10 rounded-3xl shadow-xl border border-white/20 max-w-2xl w-full">
    <h1 class="text-4xl font-bold text-gray-900 mb-8 text-center tracking-tight">New Pizza Order</h1>

    <form action="/new-order" method="POST" class="space-y-6">
      <div class="space-y-5">
        <h2 class="text-xl font-semibold text-gray-800 mb-4">Customer Information</h2>
        <div>
          <label class="block text-gray-700 text-sm font-medium mb-2" for="name">Name</label>
          <input type="text" id="name" name="name" required minlength="2" maxlength="100" class="w-full p-2 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:border-transparent transition-all">
        </div>
        <div>
          <label class="block text-gray-700 text-sm font-medium mb-2" for="phone">Phone</label>
          <input type="tel" id="phone" name="phone" required minlength="10" maxlength="20" class="w-full p-2 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:border-transparent transition-all">
        </div>
        <div>
          <label class="block text-gray-700 text-sm font-medium mb-2" for="address">Address</label>
          <input type="text" id="address" name="address" required minlength="5" maxlength="200" class="w-full p-2 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:border-transparent transition-all">
        </div>
      </div>

      <div class="space-y-5">
        <div class="flex justify-between items-center">
          <h2 class="text-xl font-semibold text-gray-800">Pizzas</h2>
          <button type="button" onclick="addPizza()" class="px-4 py-2 text-sm font-medium text-emerald-600 hover:text-emerald-700 border border-emerald-300 rounded-xl hover:border-emerald-400 hover:bg-emerald-50 active:scale-95 transition-all">Add Another Pizza</button>
        </div>
        <div id="pizzas" class="space-y-4"></div>
      </div>

      <button type="submit" class="w-full bg-emerald-500 text-white font-semibold py-3 px-3 rounded-xl hover:bg-emerald-600 active:scale-[0.99] transition-all shadow-lg shadow-emerald-500/30">Place Order</button>
    </form>
  </div>
</div>

<template id="pizzaTemplate">
  <div class="pizza-item border border-gray-200 rounded-2xl p-5 bg-gray-50/50">
    <div class="flex justify-between items-center mb-4">
      <h3 class="text-lg font-semibold text-gray-800">Pizza #<span class="pizza-number"></span></h3>
      <button type="button" onclick="removePizza(this)" class="text-red-500 hover:text-red-700 font-medium text-sm transition-colors">Remove</button>
    </div>
    <div class="space-y-4">
      <div>
        <label class="block text-gray-700 text-sm font-medium mb-2">Size</label>
        <select name="size" required class="w-full p-2 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:border-transparent transition-all bg-white">
          {{range $.PizzaSizes}}
          <option value="{{.}}">{{.}}</option>
          {{end}}
        </select>
      </div>
      <div>
        <label class="block text-gray-700 text-sm font-medium mb-2">Pizza Type</label>
        <select name="pizza" required class="w-full p-2 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:border-transparent transition-all bg-white">
          {{range $.PizzaTypes}}
          <option value="{{.}}">{{.}}</option>
          {{end}}
        </select>
      </div>
      <div>
        <label class="block text-gray-700 text-sm font-medium mb-2">Special Instructions</label>
        <textarea maxlength="200" name="instructions" rows="2" class="w-full px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:border-transparent transition-all resize-none"></textarea>
      </div>
    </div>
  </div>
</template>

<script>
  let pizzaCount = 0;

  function addPizza() {
    const clone = document.getElementById(''pizzaTemplate'').content.cloneNode(true);
    clone.querySelector(''.pizza-number'').textContent = ++pizzaCount;
    document.getElementById(''pizzas'').appendChild(clone);
  }

  function removePizza(btn) {
    btn.closest(''.pizza-item'').remove();

    document.querySelectorAll(''.pizza-item'').forEach((item, index) => {
      item.querySelector(''.pizza-number'').textContent = index + 1;
    });

    pizzaCount = document.querySelectorAll(''.pizza-item'').length;
  }

  // Add one pizza by default when page loads
  addPizza();
</script>

{{template "bottom" .}}
```

**HTML template element:** The `<template id="pizzaTemplate">` holds HTML that''s not rendered initially. JavaScript clones this template each time someone clicks "Add Another Pizza". This approach is cleaner than building HTML strings in JavaScript.

**addPizza function:** Clones the template, increments the pizza counter, updates the "Pizza #1" label, and appends it to the form. All the form fields inside use the same `name` attributes (`size`, `pizza`, `instructions`), so when submitted, the browser sends arrays like `size[]=Small&size[]=Large`.

**removePizza function:** Removes a pizza from the form and renumbers the remaining pizzas so they stay sequential.

**Why template ranges:** `{{range $.PizzaSizes}}` loops over the pizza sizes slice and creates an `<option>` for each. The `$` refers to the root data passed to the template, letting you access it inside nested blocks.

**Auto-add first pizza:** The `addPizza()` call at the end ensures customers see one pizza field immediately when they load the form. They can click "Add Another Pizza" to order multiple pizzas.

### Customer Tracking Page

After submitting an order, customers need confirmation that it worked.

Create `templates/customer.tmpl`:

```html
{{template "top" .}}
    <title>Order Status</title>
</head>
<body class="p-8">
  <div class="max-w-md mx-auto text-center">
    <h1 class="text-2xl font-bold mb-4">Order Placed Successfully!</h1>
    <p class="text-lg mb-2">Order ID:</p>
    <p class="text-xl font-bold mb-4">{{.Order.ID}}</p>
  </div>
{{template "bottom" .}}
```

### Test Order Submission

Before continuing, let''s test the order submission feature to make sure everything works.

![Order Form](docs/images/order-form.png)
_The customer order form with multiple pizza selections_

Start your server:

```bash
go mod tidy && go run cmd/*.go
```

The `go mod tidy` command downloads all dependencies and adds their indirect dependencies to `go.mod`. You''ll see output like:

```
time=2025-10-16T14:08:23.789+07:00 level=INFO msg="Database initialized successfully"
[GIN-debug] [WARNING] Creating an Engine instance with the Logger and Recovery middleware already attached.

[GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
 - using env:   export GIN_MODE=release
 - using code:  gin.SetMode(gin.ReleaseMode)

[GIN-debug] GET    /                         --> main.(*Handler).ServeNewOrderForm-fm (3 handlers)
[GIN-debug] POST   /new-order                --> main.(*Handler).HandleNewOrderPost-fm (3 handlers)
[GIN-debug] GET    /customer/:id             --> main.(*Handler).ServeCustomer-fm (3 handlers)
[GIN-debug] GET    /static/*filepath         --> github.com/gin-gonic/gin.(*RouterGroup).createStaticHandler.func1 (3 handlers)
[GIN-debug] HEAD   /static/*filepath         --> github.com/gin-gonic/gin.(*RouterGroup).createStaticHandler.func1 (3 handlers)
time=2025-10-16T14:08:23.790+07:00 level=INFO msg="Server starting" url=http://localhost:8080
```

1. Open `http://localhost:8080` in your browser
2. You''ll see the order form with one pizza field already visible
3. Fill out your name, phone, and address
4. Select a size and pizza type for the first pizza
5. Add special instructions like "Extra cheese" if desired
6. Click "Add Another Pizza" to add more pizzas
7. Click "Place Order"
8. You should be redirected to `/customer/{orderID}` showing "Order Placed Successfully!" with your order ID

If you see the order ID, order submission is working! You''ve successfully built order submission with database storage, form validation, and dynamic pizza fields.

If you get a JSON error response, check the server logs for validation errors.

## Track Order Status

By the end of this section, customers will be able to view their order details on a beautiful tracking page showing customer information, pizza details, and a visual progress bar indicating the current status.

Right now the tracking page just shows "Order Placed Successfully!" with the order ID. We''ll upgrade it to show full order details, all the pizzas ordered, and a visual progress indicator. We already have the `ServeCustomer` handler and `/customer/:id` route from the previous section, so we just need to pass richer data from the handler and expand the template.

### Update Customer Tracking Handler

We need to pass more data to the template - specifically the full order details and the list of statuses for the progress bar.

Add the `CustomerData` struct at the top of `cmd/customer.go` (after the imports):

```go
type CustomerData struct {
	Title    string
	Order    models.Order
	Statuses []string
}
```

Now update the `ServeCustomer` handler in `cmd/customer.go` to use this struct instead of the simple `gin.H`:

```go
func (h *Handler) ServeCustomer(c *gin.Context) {
	orderID := c.Param("id")
	if orderID == "" {
		c.String(http.StatusBadRequest, "Order ID is required")
		return
	}

	order, err := h.orders.GetOrder(orderID)
	if err != nil {
		c.String(http.StatusNotFound, "Order not found")
		return
	}

	c.HTML(http.StatusOK, "customer.tmpl", CustomerData{
		Title:    "Pizza Order Status " + orderID,
		Order:    *order,
		Statuses: models.OrderStatuses,
	})
}
```

**What changed:** We changed from passing a simple `gin.H{"Order": order}` to passing a `CustomerData` struct that includes the page title, the order, and the list of all possible statuses. The template will use the statuses list to build the progress bar.

**Why add CustomerData struct:** As our tracking page gets more sophisticated, we need to pass multiple pieces of data. A struct makes this cleaner and more type-safe than a generic map.

### Add JSON Template Helper

The tracking page will need to pass Go data (like the status array) to JavaScript. Instead of using complex Go template syntax to manually build JSON, we''ll add a simple `json` helper function.

Update the `loadTemplates` function in `cmd/utils.go` to add the `json` helper:

```go
func loadTemplates(router *gin.Engine) error {
	functions := template.FuncMap{
		"add": func(a, b int) int { return a + b },
		"json": func(v interface{}) template.JS {
			b, _ := json.Marshal(v)
			return template.JS(b)
		},
	}

	tmpl, err := template.New("").Funcs(functions).ParseGlob("templates/*.tmpl")
	if err != nil {
		return err
	}

	router.SetHTMLTemplate(tmpl)
	return nil
}
```

Make sure `cmd/utils.go` has the `encoding/json` import at the top:

```go
import (
	"encoding/json"
	"html/template"
	"os"

	"github.com/gin-gonic/gin"
)
```

**json helper:** Takes any Go value, marshals it to JSON, and wraps it in `template.JS` so it can be safely embedded in `<script>` tags. Now in templates we can write `{{json .Statuses}}` instead of `[{{range $index, $status := .Statuses}}{{if $index}},{{end}}"{{$status}}"{{end}}]`.

### Update Customer Tracking Template

Now we''ll replace the content in `templates/customer.tmpl` to show the full tracking interface. Replace the entire file contents:

```html
{{template "top" .}}
    <title>{{.Title}}</title>
    <style>
      @keyframes spin-slow {
        to { transform: rotate(360deg); }
      }
      .animate-spin-slow {
        animation: spin-slow 5s linear infinite;
      }
    </style>
</head>
<body class="bg-gradient-to-br from-amber-50 via-orange-50 to-rose-50 min-h-screen">
<div class="flex flex-col items-center p-6 md:p-8">
  <img src="/static/pizza.svg" class="w-48 h-48 mb-10 animate-spin-slow drop-shadow-lg" alt="Pizza loading...">

  <div id="statusContainer" class="bg-white/80 backdrop-blur-sm p-8 md:p-10 rounded-3xl shadow-2xl border border-white/20 max-w-3xl w-full">
    <h1 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4 text-center tracking-tight">
      Track Your Pizza Order
    </h1>
    <div class="text-lg text-gray-500 mb-10 text-center font-medium">
      Order #{{ .Order.ID }}
    </div>

    <div class="relative flex justify-between items-center mb-4">
      <div id="progressLine" class="absolute inset-x-[30px] h-1.5 bg-gray-200 top-1/2 -translate-y-1/2 rounded-full"></div>
      {{range $index, $status := .Statuses}}
      <div class="flex-1 flex justify-center relative mx-2">
        <div id="step{{add $index 1}}" class="size-14 bg-gray-300 rounded-full flex items-center justify-center text-white font-bold transition-all duration-300 z-10 shadow-md">
          {{add $index 1}}
        </div>
      </div>
      {{end}}
    </div>

    <div class="flex justify-between text-sm text-gray-700 mb-10 font-semibold">
      {{range .Statuses}}
      <span class="flex-1 text-center mx-2">{{.}}</span>
      {{end}}
    </div>

    <div class="bg-gray-50/60 p-6 rounded-2xl mb-6 border border-gray-100">
      <h2 class="text-xl font-semibold text-gray-800 mb-5">Order Details</h2>
      <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
        <div>
          <p class="text-sm text-gray-500 mb-1">Customer Name</p>
          <p class="font-semibold text-gray-900">{{ .Order.CustomerName }}</p>
        </div>
        <div>
          <p class="text-sm text-gray-500 mb-1">Phone</p>
          <p class="font-semibold text-gray-900">{{ .Order.Phone }}</p>
        </div>
        <div>
          <p class="text-sm text-gray-500 mb-1">Address</p>
          <p class="font-semibold text-gray-900">{{ .Order.Address }}</p>
        </div>
      </div>
    </div>

    <div class="bg-gray-50/60 p-6 rounded-2xl border border-gray-100">
      <h2 class="text-xl font-semibold text-gray-800 mb-5">Pizzas</h2>
      <div class="space-y-4">
        {{range $index, $pizza := .Order.Items}}
        <div class="border border-gray-200 rounded-xl p-5 bg-white/70">
          <h3 class="text-lg font-semibold text-gray-800 mb-4">
            Pizza #{{add $index 1}}
          </h3>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <p class="text-sm text-gray-500 mb-1">Type</p>
              <p class="font-semibold text-gray-900">{{ $pizza.Pizza }}</p>
            </div>
            <div>
              <p class="text-sm text-gray-500 mb-1">Size</p>
              <p class="font-semibold text-gray-900">{{ $pizza.Size }}</p>
            </div>
            <div class="md:col-span-2">
              <p class="text-sm text-gray-500 mb-1">Special Instructions</p>
              <p class="font-semibold text-gray-900">{{if $pizza.Instructions}}{{$pizza.Instructions}}{{else}}None{{end}}</p>
            </div>
          </div>
        </div>
        {{ end }}
      </div>
    </div>
  </div>
</div>

<script>
  const statuses = {{json .Statuses}};

  function updateStatusBar(currentStatus) {
    const currentIndex = statuses.indexOf(currentStatus);
    statuses.forEach((status, index) => {
      const step = document.getElementById(`step${index + 1}`);
      if (index <= currentIndex) {
        step.classList.remove("bg-gray-300");
        step.classList.add("bg-emerald-500");
      }
    });

    const progressLine = document.getElementById("progressLine");
    const progressPercentage = Math.max((currentIndex / (statuses.length - 1)) * 100, 5);
    progressLine.style.background = `linear-gradient(to right, #10b981 ${progressPercentage}%, #e5e7eb ${progressPercentage}%)`;
  }

  updateStatusBar("{{.Order.Status}}");
</script>

{{template "bottom" .}}
```

**Progress indicator:** The template creates circular step indicators for each status. The `updateStatusBar` function highlights completed steps in green based on the current status.

**Animated pizza SVG:** The spinning pizza provides visual interest while customers wait. The `animate-spin-slow` class makes it rotate slowly using a CSS animation defined in the `<style>` block.

**Dynamic status highlighting:** The JavaScript builds an array of status names, finds the current status index, and highlights all steps up to and including that status. The progress line shows a gradient that fills from left to right as the order progresses.

**Template data access:** `{{.Order.CustomerName}}` accesses fields from the Order struct we passed from the handler. The `{{range .Order.Items}}` loops over all pizzas in the order.

### Add Pizza SVG

The tracking page needs a pizza SVG for the spinning animation at the top. The `templates/static` directory already exists from the previous section, so we just need to add the SVG file: Open a terminal and run the following command:

```bash
echo ''<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
    <g>
        <!-- Pizza base (crust) -->
        <circle cx="50" cy="50" r="45" fill="#FBC02D"/>
        <!-- Pizza cheese -->
        <circle cx="50" cy="50" r="40" fill="#FFD54F"/>
        <!-- Pizza slices -->
        <path d="M50,50 L50,5 A45,45 0 0 1 95,50 Z" fill="#FBC02D"/>
        <path d="M50,50 L50,10 A40,40 0 0 1 90,50 Z" fill="#FFD54F"/>
        <!-- Toppings (pepperoni) -->
        <circle cx="70" cy="30" r="4" fill="#D84315"/>
        <circle cx="30" cy="70" r="4" fill="#D84315"/>
        <circle cx="70" cy="70" r="4" fill="#D84315"/>
        <circle cx="30" cy="30" r="4" fill="#D84315"/>
        <circle cx="50" cy="50" r="4" fill="#D84315"/>
    </g>
</svg>
''> templates/static/pizza.svg
```

This creates a simple pizza icon with an orange circle and red pepperoni. You can replace it with a more detailed pizza SVG later if you want.

### Test Order Tracking

Start your server:

```bash
go run cmd/*.go
```

1. Place a new order at `http://localhost:8080`
2. After submission, you''ll be redirected to the tracking page
3. You should see your order ID, customer details, and pizza list
4. The progress bar should show the first step ("Order Placed") highlighted in green
5. The pizza icon at the top should rotate slowly
6. Try visiting the tracking page directly by entering `http://localhost:8080/customer/{your-order-id}` in the browser

![Order Tracking Page](docs/images/tracking-page.png)
_The customer tracking page showing order status with visual progress indicator_

Now let''s test that the progress bar updates when the order status changes. Open a new terminal window (keep the server running) and view all orders:

```bash
sqlite3 -header -column data/orders.db "SELECT * FROM orders;"
```

This shows all orders in a nicely formatted table with column headers. Note the order ID from your recent order, then update its status:

```bash
sqlite3 data/orders.db "UPDATE orders SET status = ''Preparing'' WHERE id = ''YOUR_ORDER_ID'';"
```

Replace `YOUR_ORDER_ID` with your actual order ID from the previous query.

After updating the status, reload the tracking page in your browser. The progress bar should now show both "Order Placed" and "Preparing" highlighted in green, with the progress line extending to the second step.

In the next sections, we''ll build an admin dashboard so staff can update order statuses through a web interface instead of using SQL commands.

If the page looks broken, check that:

- Templates are loading correctly (check server logs)
- The pizza SVG file exists at `templates/static/pizza.svg`
- Tailwind CSS is loading from the CDN
- The order ID in the URL is valid

this section is complete! Customers can now track their orders with a beautiful visual interface. Next, we''ll add admin authentication so staff can manage orders.

## Admin Login

By the end of this section, admins will be able to log in with a username and password. The app will store encrypted session data in cookies and protect admin routes from unauthorized access.

We need to add user authentication to the database models, create login handlers, and implement middleware to protect admin routes.

### User Authentication Model

Admins need to log in to access the dashboard. We''ll create a user model with bcrypt password hashing for security.

Create `internal/models/user.go`:

```go
package models

import (
	"errors"

	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

type User struct {
	ID       string `gorm:"primaryKey"`
	Username string `gorm:"uniqueIndex;not null"`
	Password string `gorm:"not null"`
}

type UserModel struct {
	DB *gorm.DB
}

func (u *UserModel) AuthenticateUser(username, password string) (*User, error) {
	var user User
	if err := u.DB.Where("username = ?", username).First(&user).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("invalid credentials")
		}
		return nil, err
	}

	if err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(password)); err != nil {
		return nil, errors.New("invalid credentials")
	}

	return &user, nil
}

func (u *UserModel) GetUserByID(id string) (*User, error) {
	var user User
	if err := u.DB.First(&user, "id = ?", id).Error; err != nil {
		return nil, err
	}
	return &user, nil
}
```

**User struct:** Stores admin credentials. The `uniqueIndex` tag on Username ensures no duplicate usernames. The Password field stores bcrypt hashes, never plain text passwords.

**AuthenticateUser method:** This method looks up a user by username, then compares the provided password against the hashed password stored in the database using bcrypt. If either the user doesn''t exist or the password is wrong, it returns a generic "invalid credentials" error. This prevents attackers from determining whether a username exists.

**Why bcrypt:** Bcrypt is intentionally slow (around 100-200ms per comparison). This makes brute-force attacks impractical - trying 1000 passwords would take 100+ seconds instead of milliseconds with fast hash functions like SHA-256.

### Update Database Setup

The session library (gormstore) will automatically create and manage the sessions table using the existing GORM database connection. No separate session model is needed.

Update `internal/models/models.go` to expose the GORM database instance for session storage:

```go
package models

import (
	"fmt"

	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

type DBModel struct {
	DB    *gorm.DB
	Order OrderModel
	User  UserModel
}

func InitDB(dataSourceName string) (*DBModel, error) {
	db, err := gorm.Open(sqlite.Open(dataSourceName), &gorm.Config{})
	if err != nil {
		return nil, fmt.Errorf("failed to connect to database: %v", err)
	}

	err = db.AutoMigrate(&Order{}, &OrderItem{}, &User{})
	if err != nil {
		return nil, fmt.Errorf("failed to migrate database: %v", err)
	}

	dbModel := &DBModel{
		DB:    db,
		Order: OrderModel{DB: db},
		User:  UserModel{DB: db},
	}

	return dbModel, nil
}
```

**What changed:** We added `User` to the DBModel struct so handlers can access user operations. We added `DB *gorm.DB` to expose the database connection for the session store. We added `&User{}` to AutoMigrate so GORM creates the users table. The session store will create its own sessions table automatically.

### Create Admin User

Before implementing the login page, we need to create an admin user in the database. We''ll use a bcrypt hash generator and insert the user directly via SQL.

First, generate a bcrypt hash for your password. Visit https://bcrypt-generator.com/ and enter any password you want. For this example, we''ll use the hash for `password1234`:

```
$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYyqr/F/3Rq
```

Now insert the admin user into the database (replace with your generated hash if you chose a different password):

```bash
sqlite3 data/orders.db ''INSERT INTO users (id, username, password) VALUES ("admin-user", "admin", "$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYyqr/F/3Rq");''
```

Verify the user was created:

```bash
sqlite3 -header -column data/orders.db "SELECT * FROM users;"
```

You should see output similar to:

```
id          username    password
----------  ----------  ------------------------------------------------------------
admin-user  admin       $2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYyqr/F/3Rq
```

**Security note:** In production, use a strong randomly-generated password (20+ characters with mixed case, numbers, and symbols) and never commit passwords or hashes to version control.

### Session and Authentication Middleware

We need middleware to handle sessions and protect admin routes from unauthorized access.

Create `cmd/middleware.go`:

```go
package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

// AuthMiddleware protects admin routes
func (h *Handler) AuthMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		userID := GetSessionString(c, "userID")
		if userID == "" {
			c.Redirect(http.StatusSeeOther, "/login")
			c.Abort()
			return
		}

		user, err := h.users.GetUserByID(userID)
		if err != nil {
			ClearSession(c)
			c.Redirect(http.StatusSeeOther, "/login")
			c.Abort()
			return
		}

		c.Set("user", user)
		c.Next()
	}
}
```

**AuthMiddleware:** Checks if a user is logged in by looking for `userID` in the session. If not found, redirects to login. If found, loads the full user record and attaches it to the request context. This middleware runs before admin handlers, ensuring only authenticated users can access protected routes.

**Why clear sessions on error:** If someone''s user ID is in the session but doesn''t exist in the database (maybe the user was deleted), we clear the session and redirect to login. This prevents edge cases where invalid sessions persist.

**Session helpers:** We use `GetSessionString()` and `ClearSession()` helper functions from `utils.go` to simplify session operations. These wrap the gin-contrib/sessions API.

### Admin Login Handlers

Now we''ll create handlers for the login page, login processing, logout, and the admin dashboard.

Create `cmd/admin.go`:

```go
package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

type LoginData struct {
	Error string
}

type AdminDashboardData struct {
	Username string
}

func (h *Handler) HandleLoginGet(c *gin.Context) {
	c.HTML(http.StatusOK, "login.tmpl", LoginData{})
}

func (h *Handler) HandleLoginPost(c *gin.Context) {
	var form struct {
		Username string `form:"username" binding:"required,min=3,max=50"`
		Password string `form:"password" binding:"required,min=6"`
	}

	if err := c.ShouldBind(&form); err != nil {
		c.HTML(http.StatusOK, "login.tmpl", LoginData{
			Error: "Invalid input: " + err.Error(),
		})
		return
	}

	user, err := h.users.AuthenticateUser(form.Username, form.Password)
	if err != nil {
		c.HTML(http.StatusOK, "login.tmpl", LoginData{
			Error: "Invalid credentials",
		})
		return
	}

	SetSessionValue(c, "userID", user.ID)
	SetSessionValue(c, "userName", user.Username)

	c.Redirect(http.StatusSeeOther, "/admin")
}

func (h *Handler) HandleLogout(c *gin.Context) {
	if err := ClearSession(c); err != nil {
		c.String(http.StatusInternalServerError, err.Error())
		return
	}

	c.Redirect(http.StatusSeeOther, "/login")
}

func (h *Handler) ServeAdminDashboard(c *gin.Context) {
	username := GetSessionString(c, "userName")

	c.HTML(http.StatusOK, "admin.tmpl", AdminDashboardData{
		Username: username,
	})
}
```

**HandleLoginGet:** Renders the login form with no error message initially.

**HandleLoginPost:** Validates the form, calls `AuthenticateUser` to check credentials, and stores both the user ID and username in the session if successful. Using `SetSessionValue()` saves the data and automatically persists it to the database.

**HandleLogout:** Clears all session data using `ClearSession()`, logging the user out and redirecting to the login page.

**ServeAdminDashboard:** Retrieves the username directly from the session using `GetSessionString()` and renders the admin dashboard. No database query needed since we stored the username during login.

**Why render with error instead of JSON:** For login failures, we re-render the login form with the error message displayed. This provides better UX than returning JSON errors that users would have to handle with JavaScript.

### Update Handler Structure

Update `cmd/handlers.go` to include the user model:

```go
package main

import (
	"pizza-tracker-go-demo/internal/models"
)

// Handler holds all dependencies for HTTP handlers
type Handler struct {
	orders              *models.OrderModel
	users               *models.UserModel
	notificationManager *NotificationManager
}

func NewHandler(dbModel *models.DBModel) *Handler {
	return &Handler{
		orders:              &dbModel.Order,
		users:               &dbModel.User,
		notificationManager: NewNotificationManager(),
	}
}
```

**What changed:** We added `users` field to the Handler struct and removed `sessionManager` (sessions are now accessed through helper functions). The notification manager handles real-time updates via Server-Sent Events.

### Update Routes

Update `cmd/routes.go` to add login routes and session middleware:

```go
package main

import (
	"github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
)

func setupRoutes(router *gin.Engine, h *Handler, store sessions.Store) {
	router.Use(sessions.Sessions("pizza-tracker", store))

	// Customer routes
	router.GET("/", h.ServeNewOrderForm)
	router.POST("/new-order", h.HandleNewOrderPost)
	router.GET("/customer/:id", h.ServeCustomer)
	router.GET("/notifications", h.notificationHandler)

	// Auth routes
	router.GET("/login", h.HandleLoginGet)
	router.POST("/login", h.HandleLoginPost)
	router.POST("/logout", h.HandleLogout)

	// Admin routes (protected)
	admin := router.Group("/admin")
	admin.Use(h.AuthMiddleware())
	{
		admin.GET("", h.ServeAdminDashboard)
		admin.GET("/notifications", h.adminNotificationHandler)
	}

	// Static files
	router.Static("/static", "./templates/static")
}
```

**What changed:** We use `sessions.Sessions()` middleware from gin-contrib/sessions instead of a custom wrapper. We pass the session store that was configured in `utils.go`. The middleware automatically loads and saves session data for each request. We use `h.AuthMiddleware()` to protect admin routes.

**Why apply session middleware globally:** Every request needs access to session data - even customer pages might use sessions for features like "remember my recent orders". Applying it globally is simpler than selectively applying it to specific routes.

### Add Session Setup and Helpers to Utils

Add the session setup function and helper functions to `cmd/utils.go`:

```go
func setupSessionStore(db *gorm.DB) sessions.Store {
	store := gormsessions.NewStore(db, true, []byte("secret-key-change-in-production"))
	store.Options(sessions.Options{
		Path:     "/",
		MaxAge:   86400, // 24 hours
		HttpOnly: true,
		Secure:   true,
		SameSite: 3, // Strict
	})
	slog.Info("Session store configured", "backend", "gorm-sqlite", "lifetime", "24h")
	return store
}

// Session helper functions

func GetSession(c *gin.Context) sessions.Session {
	return sessions.Default(c)
}

func SetSessionValue(c *gin.Context, key string, value interface{}) error {
	session := GetSession(c)
	session.Set(key, value)
	return session.Save()
}

func GetSessionString(c *gin.Context, key string) string {
	session := GetSession(c)
	val := session.Get(key)
	if val == nil {
		return ""
	}
	str, _ := val.(string)
	return str
}

func GetSessionValue(c *gin.Context, key string) interface{} {
	return GetSession(c).Get(key)
}

func ClearSession(c *gin.Context) error {
	session := GetSession(c)
	session.Clear()
	return session.Save()
}

func DeleteSessionKey(c *gin.Context, key string) error {
	session := GetSession(c)
	session.Delete(key)
	return session.Save()
}
```

Don''t forget to add the necessary imports at the top of `cmd/utils.go`:

```go
import (
	"encoding/json"
	"html/template"
	"log/slog"
	"os"

	"github.com/gin-contrib/sessions"
	gormsessions "github.com/wader/gormstore/v2"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)
```

**Session setup function:** Uses gormstore to create a GORM-backed session store. The store automatically creates and manages a sessions table in SQLite. The second parameter (`true`) enables automatic session cleanup of expired sessions.

**Session helper functions:** These wrap the gin-contrib/sessions API to simplify common operations like getting/setting values, clearing sessions, and deleting keys. Using helpers makes code more readable and easier to maintain.

**Security settings explained:**
- **MaxAge**: Sessions expire after 24 hours (86400 seconds)
- **HttpOnly**: Prevents JavaScript from accessing cookies (XSS protection)
- **SameSite**: Set to Strict (value 3) to prevent CSRF attacks
- **Secure**: Set to true for HTTPS-only cookies (important in production)

**Why GORM store:** Using the same database connection for both application data and sessions simplifies deployment. No need for Redis or separate session infrastructure. The gormstore library handles all the database operations automatically.

### Update Main Function

Now update `cmd/main.go` to use the session setup function:

```go
package main

import (
	"log/slog"
	"os"
	"pizza-tracker-go-demo/internal/models"

	"github.com/gin-gonic/gin"
)

func main() {
	cfg := loadConfig()

	logger := slog.New(slog.NewTextHandler(os.Stdout, nil))
	slog.SetDefault(logger)

	dbModel, err := models.InitDB(cfg.DBPath)
	if err != nil {
		slog.Error("Failed to initialize database", "error", err)
		os.Exit(1)
	}
	slog.Info("Database initialized successfully")

	sessionStore := setupSessionStore(dbModel.DB)

	h := NewHandler(dbModel)

	router := gin.Default()

	// Load templates
	if err := loadTemplates(router); err != nil {
		slog.Error("Failed to load templates", "error", err)
		os.Exit(1)
	}

	setupRoutes(router, h, sessionStore)

	RegisterCustomValidators()

	slog.Info("Server starting", "url", "https://localhost:"+cfg.Port)
	slog.Info("Admin credentials", "username", "admin", "password", "password")

	router.Run(":" + cfg.Port)
}
```

**What changed:** We pass `dbModel.DB` to `setupSessionStore()` which creates a GORM-backed session store using the same database connection. The handler no longer needs the session manager passed to it since sessions are accessed through helper functions.

**Why use the same database connection:** The gormstore library reuses the existing GORM database connection, so we don''t need a separate connection for sessions. This simplifies the code and ensures sessions and application data use the same SQLite file.

**Why persistent sessions:** Storing sessions in the database means they survive server restarts. If your server crashes or you deploy a new version, users won''t be logged out. This also enables horizontal scaling - multiple server instances can share the same session store.

**Security note:** The `Secure: true` setting requires HTTPS. For local development without HTTPS, you may need to temporarily set this to `false`, but always use `true` in production.

### Login Page Template

Create `templates/login.tmpl`:

```html
{{template "top" .}}
    <title>Login Admin</title>
</head>
<body class="bg-gradient-to-br from-orange-100 to-red-100">
<div class="min-h-screen flex items-center justify-center p-4">
  <div class="bg-white p-8 rounded-2xl shadow-xl max-w-md w-full">
    <div class="text-center mb-8">
      <h1 class="text-4xl font-bold text-gray-800 mb-2">🍕 Pizza Tracker</h1>
      <p class="text-gray-600">Admin Login</p>
    </div>

    {{if .Error}}
    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4">{{.Error}}</div>
    {{end}}

    <form action="/login" method="POST" class="space-y-6">
      <div>
        <label class="block text-gray-700 text-sm font-bold mb-2" for="username">Username</label>
        <input type="text" id="username" name="username" required class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-red-500">
      </div>
      <div>
        <label class="block text-gray-700 text-sm font-bold mb-2" for="password">Password</label>
        <input type="password" id="password" name="password" required class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-red-500">
      </div>
      <button type="submit" class="w-full bg-red-500 text-white font-bold py-2 px-4 rounded-lg hover:bg-red-600 transition-colors">Login</button>
    </form>
  </div>
</div>
{{template "bottom" .}}
```

### Basic Admin Dashboard Template

After logging in, admins need a basic dashboard. We''ll create a minimal version now and expand it with order management in the next section.

Create `templates/admin.tmpl`:

```html
{{template "top" .}}
    <title>Admin Dashboard - Pizza Tracker</title>
</head>
<body class="bg-gradient-to-br from-amber-50 via-orange-50 to-rose-50 min-h-screen p-8">
  <div class="max-w-7xl mx-auto">
    <div class="flex justify-between items-center mb-8">
      <h1 class="text-4xl font-bold text-gray-900">Pizza Tracker Admin</h1>
      <div class="flex items-center gap-4">
        <span class="text-gray-700 font-medium">Welcome, {{.Username}}</span>
        <form action="/logout" method="POST">
          <button type="submit" class="px-5 py-2.5 bg-red-500 text-white rounded-xl hover:bg-red-600 active:scale-95 transition-all shadow-sm">Logout</button>
        </form>
      </div>
    </div>
    <p class="text-gray-600">Order management coming soon...</p>
  </div>
{{template "bottom" .}}
```

**Basic dashboard layout:** Shows the admin username in the header and a logout button. The main content area currently shows a placeholder message. In the next section, we''ll replace this with a full orders table.

### Test Admin Login

Start your server (run `go mod tidy` first to download the new session and bcrypt dependencies):

```bash
go mod tidy && go run cmd/*.go
```

1. Visit `http://localhost:8080/login`
2. Enter username `admin` and password `password1234` (or the password you used when generating the bcrypt hash)
3. Click "Login"
4. You should be redirected to `/admin` and see the basic admin dashboard with your username, a logout button, and the placeholder text "Order management coming soon..."

Try these scenarios:

- Enter wrong username or password - you should see "Invalid credentials" error
- Leave fields empty - you should see validation errors
- Try accessing `http://localhost:8080/admin` without logging in - you should be redirected to `/login`
- After successful login, try the logout button - you should be logged out and redirected to the login page

The Admin Login section is complete! You now have user authentication with bcrypt password hashing, session management, and middleware to protect routes. Next, we''ll add order management to the admin dashboard.

## Admin Dashboard

By the end of this section, admins will see all orders in a table, update order status with a dropdown, and delete orders. The dashboard will show order details, customer information, and provide admin controls.

We''ll add methods to the order model for fetching all orders and updating/deleting them, create admin handlers, add admin routes with authentication middleware, and build the dashboard template.

### Update Order Model

Update `internal/models/order.go` to add methods for managing orders:

```go
package models

import (
	"time"

	"github.com/teris-io/shortid"
	"gorm.io/gorm"
)

var (
	OrderStatuses = []string{"Order Placed", "Preparing", "Baking", "Quality Check", "Ready"}

	PizzaTypes = []string{
		"Margherita",
		"Pepperoni",
		"Vegetarian",
		"Hawaiian",
		"Bbq Chicken",
		"Meat Lovers",
		"Buffalo Chicken",
		"Supreme",
		"Truffle Mushroom",
		"Four Cheese",
	}

	PizzaSizes = []string{"Small", "Medium", "Large", "X-Large"}
)

type OrderModel struct {
	DB *gorm.DB
}

type Order struct {
	ID           string      `gorm:"primaryKey;size:14" json:"id"`
	Status       string      `gorm:"not null" json:"status"`
	CustomerName string      `gorm:"not null" json:"customer_name"`
	Phone        string      `gorm:"not null" json:"phone"`
	Address      string      `gorm:"not null" json:"address"`
	Items        []OrderItem `gorm:"foreignKey:OrderID" json:"pizzas"`
	CreatedAt    time.Time   `json:"created_at"`
}

type OrderItem struct {
	ID           string `gorm:"primaryKey;size:14" json:"id"`
	OrderID      string `gorm:"index;size:14;not null" json:"order_id"`
	Size         string `gorm:"not null" json:"size" form:"size" binding:"required"`
	Pizza        string `gorm:"not null" json:"pizza" form:"pizza" binding:"required"`
	Instructions string `json:"instructions" form:"instructions"`
}

func (o *Order) BeforeCreate(tx *gorm.DB) error {
	if o.ID == "" {
		o.ID = shortid.MustGenerate()
	}
	return nil
}

func (oi *OrderItem) BeforeCreate(tx *gorm.DB) error {
	if oi.ID == "" {
		oi.ID = shortid.MustGenerate()
	}
	return nil
}

func (o *OrderModel) CreateOrder(order *Order) error {
	return o.DB.Create(order).Error
}

func (o *OrderModel) GetOrder(id string) (*Order, error) {
	var order Order
	err := o.DB.Preload("Items").First(&order, "id = ?", id).Error
	return &order, err
}

func (o *OrderModel) GetAllOrders() ([]Order, error) {
	var orders []Order
	err := o.DB.Preload("Items").Order("created_at desc").Find(&orders).Error
	return orders, err
}

func (o *OrderModel) UpdateOrderStatus(id string, status string) error {
	return o.DB.Model(&Order{}).Where("id = ?", id).Update("status", status).Error
}

func (o *OrderModel) DeleteOrder(id string) error {
	return o.DB.Select("Items").Delete(&Order{ID: id}).Error
}
```

**What changed:** We added three new methods - `GetAllOrders` fetches all orders sorted by creation date (newest first), `UpdateOrderStatus` changes an order''s status, and `DeleteOrder` removes an order and its items.

**GetAllOrders method:** Uses `Preload("Items")` to fetch all pizzas for each order. The `Order("created_at desc")` clause sorts orders by creation time, showing newest orders first. This is what the admin dashboard will display.

**UpdateOrderStatus method:** Uses GORM''s `Update` method to change only the status field. The `Where("id = ?", id)` clause ensures we only update the specified order.

**DeleteOrder method:** The `Select("Items")` tells GORM to cascade delete - when you delete an order, GORM also deletes all related pizza items. This prevents orphaned records in the database.

### Update Admin Handlers

Update `cmd/admin.go` to add order management handlers:

```go
package main

import (
	"log/slog"
	"net/http"
	"pizza-tracker-go-demo/internal/models"

	"github.com/gin-gonic/gin"
)

type LoginData struct {
	Error string
}

type AdminDashboardData struct {
	Orders   []models.Order
	Statuses []string
	Username string
}

func (h *Handler) HandleLoginGet(c *gin.Context) {
	c.HTML(http.StatusOK, "login.tmpl", LoginData{})
}

func (h *Handler) HandleLoginPost(c *gin.Context) {
	var form struct {
		Username string `form:"username" binding:"required,min=3,max=50"`
		Password string `form:"password" binding:"required,min=6"`
	}

	if err := c.ShouldBind(&form); err != nil {
		c.HTML(http.StatusOK, "login.tmpl", LoginData{
			Error: "Invalid input: " + err.Error(),
		})
		return
	}

	user, err := h.users.AuthenticateUser(form.Username, form.Password)
	if err != nil {
		c.HTML(http.StatusOK, "login.tmpl", LoginData{
			Error: "Invalid credentials",
		})
		return
	}

	SetSessionValue(c, "userID", user.ID)
	SetSessionValue(c, "userName", user.Username)

	c.Redirect(http.StatusSeeOther, "/admin")
}

func (h *Handler) HandleLogout(c *gin.Context) {
	if err := ClearSession(c); err != nil {
		c.String(http.StatusInternalServerError, err.Error())
		return
	}

	c.Redirect(http.StatusSeeOther, "/login")
}

func (h *Handler) ServeAdminDashboard(c *gin.Context) {
	orders, err := h.orders.GetAllOrders()
	if err != nil {
		slog.Error("Failed to fetch orders", "error", err)
		c.String(http.StatusInternalServerError, "Error fetching orders")
		return
	}

	username := GetSessionString(c, "userName")

	c.HTML(http.StatusOK, "admin.tmpl", AdminDashboardData{
		Orders:   orders,
		Statuses: models.OrderStatuses,
		Username: username,
	})
}

func (h *Handler) HandleOrderPut(c *gin.Context) {
	orderID := c.Param("id")
	newStatus := c.PostForm("status")

	if err := h.orders.UpdateOrderStatus(orderID, newStatus); err != nil {
		c.String(http.StatusInternalServerError, err.Error())
		return
	}

	c.Redirect(http.StatusSeeOther, "/admin")
}

func (h *Handler) HandleOrderDelete(c *gin.Context) {
	orderID := c.Param("id")

	if err := h.orders.DeleteOrder(orderID); err != nil {
		c.String(http.StatusInternalServerError, err.Error())
		return
	}

	c.Redirect(http.StatusSeeOther, "/admin")
}
```

**What changed:** We updated `AdminDashboardData` to include orders and statuses. We updated `HandleLoginPost` to store username in session (for display on dashboard). We updated `ServeAdminDashboard` to fetch all orders and pass them to the template. We added two new handlers: `HandleOrderPut` updates order status, and `HandleOrderDelete` removes orders.

**ServeAdminDashboard handler:** Fetches all orders from the database and renders the admin template with the orders list, available statuses, and username.

**HandleOrderPut handler:** Reads the order ID from the URL path (`:id` parameter) and the new status from the form POST data, updates the order in the database, then redirects back to the admin dashboard.

**HandleOrderDelete handler:** Reads the order ID from the URL path, deletes the order and its items, then redirects back to the admin dashboard.

**Why redirect after changes:** After updating or deleting orders, we redirect to the dashboard so admins see the updated order list. This follows the Post-Redirect-Get pattern that prevents duplicate form submissions if someone refreshes the page.

### Update Routes

Update `cmd/routes.go` to add admin routes with authentication:

```go
package main

import (
	"github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
)

func setupRoutes(router *gin.Engine, h *Handler, store sessions.Store) {
	router.Use(sessions.Sessions("pizza-tracker", store))

	// Customer routes
	router.GET("/", h.ServeNewOrderForm)
	router.POST("/new-order", h.HandleNewOrderPost)
	router.GET("/customer/:id", h.ServeCustomer)

	// Auth routes
	router.GET("/login", h.HandleLoginGet)
	router.POST("/login", h.HandleLoginPost)
	router.POST("/logout", h.HandleLogout)

	// Admin routes (protected)
	admin := router.Group("/admin")
	admin.Use(h.AuthMiddleware())
	{
		admin.GET("", h.ServeAdminDashboard)
		admin.POST("/order/:id/update", h.HandleOrderPut)
		admin.POST("/order/:id/delete", h.HandleOrderDelete)
	}

	// Static files
	router.Static("/static", "./templates/static")
}
```

**What changed:** We added two new routes to the admin group: `POST /admin/order/:id/update` for updating order status and `POST /admin/order/:id/delete` for deleting orders. Both routes are automatically protected by the `AuthMiddleware` applied to the admin group.

### Admin Dashboard Template

Update `templates/admin.tmpl` to show the orders table with management controls:

```html
{{template "top" .}}
    <title>Admin Dashboard - Pizza Tracker</title>
</head>
<body class="bg-gradient-to-br from-amber-50 via-orange-50 to-rose-50 min-h-screen">
<div class="container mx-auto px-4 py-8 md:py-12">
  <div class="max-w-[95%] mx-auto">
    <div class="flex justify-between items-center mb-8">
      <div>
        <h1 class="text-4xl md:text-5xl font-bold text-gray-900 mb-2 tracking-tight">Pizza Tracker</h1>
        <p class="text-gray-600 text-lg">Track and manage all your pizza orders</p>
      </div>
      <div class="flex items-center gap-4">
        <span class="text-gray-700 font-medium">Welcome, {{.Username}}</span>
        <form action="/logout" method="POST">
          <button type="submit" class="px-5 py-2.5 bg-red-500 text-white text-sm font-medium rounded-xl hover:bg-red-600 active:scale-95 transition-all shadow-sm">Logout</button>
        </form>
      </div>
    </div>

    <div class="bg-white/80 backdrop-blur-sm rounded-3xl shadow-xl border border-white/20 overflow-hidden">
      <div class="p-6 md:p-8">
          <div class="flex items-center mb-8">
            <h2 class="text-2xl font-semibold text-gray-900 mr-2">Active Orders</h2>
            <button onclick="location.reload()" class="text-gray-500 hover:text-gray-700 transition-colors ml-2 p-1.5 rounded-lg hover:bg-gray-100">
              <span class="text-xl">🔄</span>
            </button>
          </div>
          <div class="w-full overflow-x-auto rounded-xl border border-gray-200">
            <table class="w-full">
              <thead>
                <tr class="bg-gray-50/80 border-b border-gray-200">
                  <th class="px-6 py-4 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Order ID</th>
                  <th class="px-6 py-4 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Status</th>
                  <th class="px-6 py-4 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Name</th>
                  <th class="px-6 py-4 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Phone</th>
                  <th class="px-6 py-4 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Address</th>
                  <th class="px-6 py-4 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Pizzas</th>
                  <th class="px-6 py-4 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Actions</th>
                </tr>
              </thead>
              <tbody class="bg-white/70 divide-y divide-gray-100">
                {{range .Orders}}
                <tr class="hover:bg-gray-50/50 transition-colors">
                  <td class="px-6 py-4 whitespace-nowrap text-sm">
                    <a href="/customer/{{.ID}}" class="text-blue-600 hover:text-blue-700 font-medium hover:underline">{{.ID}}</a>
                  </td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 font-medium">{{.Status}}</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">{{.CustomerName}}</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">{{.Phone}}</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">{{.Address}}</td>
                  <td class="px-6 py-4 text-sm text-gray-700">
                    <div class="space-y-1">
                      {{range $index, $pizza := .Items}}
                      <div class="flex items-center gap-2">
                        <span class="text-gray-400">#{{add $index 1}}</span>
                        <span class="truncate">{{$pizza.Size}} {{$pizza.Pizza}}</span>
                        {{if $pizza.Instructions}}
                        <span class="size-4 text-gray-400 cursor-help" title="{{$pizza.Instructions}}">ⓘ</span>
                        {{end}}
                      </div>
                      {{end}}
                    </div>
                  </td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm">
                    <div class="flex gap-2">
                      <form action="/admin/order/{{.ID}}/update" method="POST">
                        <select name="status" class="px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:border-transparent transition-all bg-white font-medium" onchange="this.form.submit()">
                          {{$currentStatus := .Status}}
                          {{range $.Statuses}}
                          <option value="{{.}}" {{if eq . $currentStatus}}selected{{end}}>{{.}}</option>
                          {{end}}
                        </select>
                      </form>
                      <form action="/admin/order/{{.ID}}/delete" method="POST">
                        <button type="submit" class="p-2 text-white bg-red-500 rounded-lg hover:bg-red-600 active:scale-95 focus:outline-none focus:ring-2 focus:ring-red-400 transition-all" onclick="return confirm(''Are you sure you want to delete this order?'')">
                          <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                          </svg>
                        </button>
                      </form>
                    </div>
                  </td>
                </tr>
                {{end}}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

{{template "bottom" .}}
```

**Orders table:** Displays all order information in a responsive table. The Order ID links to the customer tracking page so admins can see what customers see.

**Status dropdown:** The `<select name="status">` dropdown shows all available statuses with the current status pre-selected. When changed, JavaScript automatically submits the form using `onchange="this.form.submit()"`. The handler updates the database and reloads the page.

**Delete button:** The delete button includes `onclick="return confirm()"` to prevent accidental deletions. If the user cancels the confirmation, the form doesn''t submit.

**Pizza list with instructions:** Each order row shows a compact list of pizzas. If a pizza has special instructions, an info icon appears that shows the instructions in a tooltip when you hover over it.

**Refresh button:** The refresh button reloads the page to show updated orders. In the Real-Time Updates section, we''ll add real-time updates that notify admins when new orders arrive without needing to refresh.

### Test Admin Dashboard

Start your server:

```bash
go run cmd/*.go
```

1. Log in at `http://localhost:8080/login` with username `admin` and password `password`
2. You should see the admin dashboard with all orders in a table

![Admin Dashboard](docs/images/admin-dashboard.png)
_The admin dashboard showing all orders with status dropdowns and delete buttons_

3. If you haven''t created any orders yet, the table will be empty
4. Place a test order in another browser tab or incognito window
5. Refresh the admin dashboard - you should see the new order appear
6. Try changing an order''s status using the dropdown - the page should reload and show the updated status
7. Try deleting an order - you should see a confirmation dialog, then the order disappears
8. Click the Order ID link to view the customer tracking page for that order

If the dashboard doesn''t load:

- Make sure you''re logged in (check for redirect to `/login`)
- Check server logs for errors loading orders
- Verify the admin.tmpl template exists and has no syntax errors

Try accessing `http://localhost:8080/admin` without logging in - you should be redirected to the login page. This confirms the authentication middleware is working.

the Admin Dashboard section is complete! Admins can now view all orders, update status, and delete orders. Next, we''ll add real-time updates using Server-Sent Events so the dashboard shows new orders automatically and customer tracking pages update when status changes.

## Real-Time Updates with Server-Sent Events

By the end of this section, customer tracking pages will automatically reload when admins update order status, and the admin dashboard will show a notification badge when new orders arrive - all without page refreshes or polling.

Server-Sent Events (SSE) let the server push updates to connected clients over HTTP. Unlike WebSockets which require a persistent TCP connection, SSE uses regular HTTP and automatically reconnects if the connection drops.

We''ll build a notification manager to track connected clients, create SSE event handlers for customers and admins, update existing handlers to send notifications when orders change, and add JavaScript to customer and admin pages to receive updates.

### Understanding the Technologies

Before we implement real-time updates, let''s understand the key technologies we''ll use:

**Server-Sent Events (SSE):**

SSE is a web standard that allows servers to push data to browsers over HTTP. Think of it like a one-way radio broadcast - the server can send messages to the client anytime, but the client can''t send messages back through the same connection. For our pizza tracker, this is perfect because we only need the server to notify clients about changes (new orders, status updates).

How SSE differs from alternatives:

- **vs Polling:** Instead of the browser asking "any updates?" every few seconds (polling), SSE keeps a connection open and the server pushes updates when they happen. This is more efficient and provides instant updates.
- **vs WebSockets:** WebSockets allow two-way communication (client and server can both send messages). SSE is simpler because it''s one-way and uses regular HTTP. For our use case (server tells clients about updates), SSE is perfect.

**Go Channels:**

Channels are Go''s way of letting different parts of your code communicate safely. Think of a channel like a pipe - one part of your code can put messages in one end, and another part can read messages from the other end.

In our app:

- Each browser connection gets its own channel
- When an order status changes, we send a message into the channel
- The SSE handler reads from the channel and sends it to the browser

**Goroutines and Concurrency:**

A goroutine is a lightweight thread in Go. When a browser connects to our SSE endpoint, Go creates a goroutine to handle that connection. This means our server can handle hundreds or thousands of connections simultaneously without creating heavy operating system threads.

The challenge: Multiple goroutines might try to access our list of connected clients at the same time. If goroutine A is adding a client while goroutine B is removing one, we could corrupt our data.

The solution: `sync.RWMutex` (Read-Write Mutex). This is like a lock:

- When we need to change the client list (add/remove), we grab an exclusive lock - no one else can read or write
- When we need to read the client list (send notifications), we grab a shared lock - many goroutines can read simultaneously, but no one can write

**Why this architecture:**

Our notification system uses a "pub-sub" (publish-subscribe) pattern:

1. Clients "subscribe" by opening an SSE connection and registering their channel
2. When events happen (order created, status updated), we "publish" by sending messages to relevant channels
3. Each client receives only the messages they care about (customers see their order updates, admins see all new orders)

This scales well because:

- We don''t store messages - they''re sent immediately
- Each client maintains its own connection independently
- If a client disconnects, we clean up their channel and move on

Now let''s implement this system step by step.

### Notification Manager

We need a way to track which clients are listening for updates and send them notifications when events occur.

Create `cmd/notifications.go`:

```go
package main

import "sync"

type NotificationManager struct {
	clients map[string]map[chan string]bool // key: "order:<id>" or "admin:new_orders"
	mu      sync.RWMutex
}

func NewNotificationManager() *NotificationManager {
	return &NotificationManager{
		clients: make(map[string]map[chan string]bool),
	}
}

func (n *NotificationManager) AddClient(key string, client chan string) {
	n.mu.Lock()
	defer n.mu.Unlock()

	if n.clients[key] == nil {
		n.clients[key] = make(map[chan string]bool)
	}
	n.clients[key][client] = true
}

func (n *NotificationManager) RemoveClient(key string, client chan string) {
	n.mu.Lock()
	defer n.mu.Unlock()

	if clients := n.clients[key]; clients != nil {
		delete(clients, client)
		if len(clients) == 0 {
			delete(n.clients, key)
		}
	}
	close(client)
}

func (n *NotificationManager) Notify(key, message string) {
	n.mu.RLock()
	defer n.mu.RUnlock()

	for client := range n.clients[key] {
		select {
		case client <- message:
		default:
		}
	}
}
```

**NotificationManager struct:** This manages a map of notification channels grouped by key. Keys look like `"order:aBc123XyZ"` for specific orders or `"admin:new_orders"` for the admin dashboard. Each key maps to a set of client channels.

**AddClient method:** When a customer opens a tracking page, we create a channel and register it with the key `"order:{orderID}"`. When an admin opens the dashboard, we register with key `"admin:new_orders"`.

**RemoveClient method:** When a client disconnects (closes the browser tab or loses connection), we remove their channel and close it to prevent memory leaks.

**Notify method:** When an event occurs (order status updated, new order created), we find all registered clients for that key and send them a message. The `select` with `default` prevents blocking if a client''s channel buffer is full - we skip that client instead of waiting.

**Why use sync.RWMutex:** Multiple goroutines access the clients map concurrently (one per HTTP request). RWMutex allows multiple readers simultaneously but exclusive write access, improving performance compared to a regular mutex.

![Server-Sent Events Architecture](docs/images/sse-diagram.png)
_How Server-Sent Events work: The server maintains persistent connections to clients and pushes updates when events occur_

### SSE Event Handlers

Now we''ll create handlers that stream SSE events to clients.

Create `cmd/events.go`:

```go
package main

import (
	"fmt"
	"log/slog"
	"strings"

	"github.com/gin-gonic/gin"
)

func (h *Handler) notificationHandler(c *gin.Context) {
	orderID := c.Query("orderId")
	if orderID == "" || strings.ToLower(orderID) == "all" {
		c.String(400, "Invalid orderId")
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
		slog.Info("Admin client disconnected")
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
			return true // Continue streaming
		}
		return false // Stop streaming
	})
}
```

**notificationHandler:** This handler serves customer tracking pages. It reads the `orderId` from the query string, creates a channel, registers it with the notification manager, and streams SSE events. When the connection closes, the deferred function removes the client.

**adminNotificationHandler:** Similar to the customer handler but uses the key `"admin:new_orders"` to receive notifications about all new orders instead of a specific order.

**streamSSE helper:** Uses Gin''s built-in `c.Stream()` method for SSE. It sets the required headers and calls the provided function repeatedly until it returns `false`. The `c.SSEvent()` method formats and sends the message in proper SSE format (`event: message\ndata: ...\n\n`). This is cleaner than manually writing to the response writer.

**Why buffer the channel:** `make(chan string, 10)` creates a buffered channel that can hold 10 messages. If the client is slow to receive messages, the buffer prevents the sender from blocking. If the buffer fills, the `select` with `default` in `Notify` skips that client.

**How c.Stream() works:** Gin''s `Stream()` method handles the streaming loop automatically. It repeatedly calls the provided function until it returns `false`. The function receives messages from the channel and uses `c.SSEvent()` to format them properly. When the channel is closed (client disconnects), the receive returns `ok == false` and we stop streaming.

### Update Handler Structure

Update `cmd/handlers.go` to include the notification manager:

```go
package main

import (
	"pizza-tracker-go-demo/internal/models"
)

// Handler holds all dependencies for HTTP handlers
type Handler struct {
	orders              *models.OrderModel
	users               *models.UserModel
	notificationManager *NotificationManager
}

func NewHandler(dbModel *models.DBModel) *Handler {
	return &Handler{
		orders:              &dbModel.Order,
		users:               &dbModel.User,
		notificationManager: NewNotificationManager(),
	}
}
```

**What changed:** We added `notificationManager` to the Handler struct and initialize it in the constructor with `NewNotificationManager()`. The sessionManager field was removed since sessions are now accessed through helper functions.

### Update Customer Handler

Update `cmd/customer.go` to notify admins when new orders arrive:

```go
package main

import (
	"log/slog"
	"net/http"
	"pizza-tracker-go-demo/internal/models"

	"github.com/gin-gonic/gin"
)

type CustomerData struct {
	Title    string
	Order    models.Order
	Statuses []string
}

type OrderFormData struct {
	PizzaTypes []string
	PizzaSizes []string
}

type OrderRequest struct {
	Name         string   `form:"name" binding:"required,min=2,max=100"`
	Phone        string   `form:"phone" binding:"required,min=10,max=20"`
	Address      string   `form:"address" binding:"required,min=5,max=200"`
	Sizes        []string `form:"size" binding:"dive,valid_pizza_size"`
	PizzaTypes   []string `form:"pizza" binding:"dive,valid_pizza_type"`
	Instructions []string `form:"instructions" binding:"max=200"`
}

func (h *Handler) ServeNewOrderForm(c *gin.Context) {
	c.HTML(http.StatusOK, "order.tmpl", OrderFormData{
		PizzaTypes: models.PizzaTypes,
		PizzaSizes: models.PizzaSizes,
	})
}

func (h *Handler) HandleNewOrderPost(c *gin.Context) {
	var form OrderRequest

	if err := c.ShouldBind(&form); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	orderItems := make([]models.OrderItem, len(form.Sizes))
	for i := range orderItems {
		orderItems[i] = models.OrderItem{
			Size:         form.Sizes[i],
			Pizza:        form.PizzaTypes[i],
			Instructions: form.Instructions[i],
		}
	}

	order := models.Order{
		CustomerName: form.Name,
		Phone:        form.Phone,
		Address:      form.Address,
		Status:       models.OrderStatuses[0], // "Order Placed"
		Items:        orderItems,
	}

	if err := h.orders.CreateOrder(&order); err != nil {
		slog.Error("Failed to create order", "error", err)
		c.String(http.StatusInternalServerError, err.Error())
		return
	}

	slog.Info("Order created", "order_id", order.ID, "customer", order.CustomerName)

	h.notificationManager.Notify("admin:new_orders", "new_order")

	c.Redirect(http.StatusSeeOther, "/customer/"+order.ID)
}

func (h *Handler) ServeCustomer(c *gin.Context) {
	orderID := c.Param("id")
	if orderID == "" {
		c.String(http.StatusBadRequest, "Order ID is required")
		return
	}

	order, err := h.orders.GetOrder(orderID)
	if err != nil {
		c.String(http.StatusNotFound, "Order not found")
		return
	}

	c.HTML(http.StatusOK, "customer.tmpl", CustomerData{
		Title:    "Pizza Order Status " + orderID,
		Order:    *order,
		Statuses: models.OrderStatuses,
	})
}
```

**What changed:** We added `h.notificationManager.Notify("admin:new_orders", "new_order")` after creating an order. This sends a notification to all connected admin dashboards.

### Update Admin Handler

Update `cmd/admin.go` to notify customers when order status changes:

```go
package main

import (
	"log/slog"
	"net/http"
	"pizza-tracker-go-demo/internal/models"

	"github.com/gin-gonic/gin"
)

type LoginData struct {
	Error string
}

type AdminDashboardData struct {
	Orders   []models.Order
	Statuses []string
	Username string
}

func (h *Handler) HandleLoginGet(c *gin.Context) {
	c.HTML(http.StatusOK, "login.tmpl", LoginData{})
}

func (h *Handler) HandleLoginPost(c *gin.Context) {
	var form struct {
		Username string `form:"username" binding:"required,min=3,max=50"`
		Password string `form:"password" binding:"required,min=6"`
	}

	if err := c.ShouldBind(&form); err != nil {
		c.HTML(http.StatusOK, "login.tmpl", LoginData{
			Error: "Invalid input: " + err.Error(),
		})
		return
	}

	user, err := h.users.AuthenticateUser(form.Username, form.Password)
	if err != nil {
		c.HTML(http.StatusOK, "login.tmpl", LoginData{
			Error: "Invalid credentials",
		})
		return
	}

	SetSessionValue(c, "userID", user.ID)
	SetSessionValue(c, "userName", user.Username)

	c.Redirect(http.StatusSeeOther, "/admin")
}

func (h *Handler) HandleLogout(c *gin.Context) {
	if err := ClearSession(c); err != nil {
		c.String(http.StatusInternalServerError, err.Error())
		return
	}

	c.Redirect(http.StatusSeeOther, "/login")
}

func (h *Handler) ServeAdminDashboard(c *gin.Context) {
	orders, err := h.orders.GetAllOrders()
	if err != nil {
		slog.Error("Failed to fetch orders", "error", err)
		c.String(http.StatusInternalServerError, "Error fetching orders")
		return
	}

	username := GetSessionString(c, "userName")

	c.HTML(http.StatusOK, "admin.tmpl", AdminDashboardData{
		Orders:   orders,
		Statuses: models.OrderStatuses,
		Username: username,
	})
}

func (h *Handler) HandleOrderPut(c *gin.Context) {
	orderID := c.Param("id")
	newStatus := c.PostForm("status")

	if err := h.orders.UpdateOrderStatus(orderID, newStatus); err != nil {
		c.String(http.StatusInternalServerError, err.Error())
		return
	}

	h.notificationManager.Notify("order:"+orderID, "order_updated")

	c.Redirect(http.StatusSeeOther, "/admin")
}

func (h *Handler) HandleOrderDelete(c *gin.Context) {
	orderID := c.Param("id")

	if err := h.orders.DeleteOrder(orderID); err != nil {
		c.String(http.StatusInternalServerError, err.Error())
		return
	}

	c.Redirect(http.StatusSeeOther, "/admin")
}
```

**What changed:** We added `h.notificationManager.Notify("order:"+orderID, "order_updated")` after updating order status. This sends a notification to any customer tracking that specific order.

### Update Routes

Update `cmd/routes.go` to add SSE event routes:

```go
package main

import (
	"github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
)

func setupRoutes(router *gin.Engine, h *Handler, store sessions.Store) {
	router.Use(sessions.Sessions("pizza-tracker", store))

	// Customer routes
	router.GET("/", h.ServeNewOrderForm)
	router.POST("/new-order", h.HandleNewOrderPost)
	router.GET("/customer/:id", h.ServeCustomer)
	router.GET("/notifications", h.notificationHandler)

	// Auth routes
	router.GET("/login", h.HandleLoginGet)
	router.POST("/login", h.HandleLoginPost)
	router.POST("/logout", h.HandleLogout)

	// Admin routes (protected)
	admin := router.Group("/admin")
	admin.Use(h.AuthMiddleware())
	{
		admin.GET("", h.ServeAdminDashboard)
		admin.POST("/order/:id/update", h.HandleOrderPut)
		admin.POST("/order/:id/delete", h.HandleOrderDelete)
		admin.GET("/notifications", h.adminNotificationHandler)
	}

	// Static files
	router.Static("/static", "./templates/static")
}
```

**What changed:** We use the `sessions.Sessions()` middleware from gin-contrib/sessions. We added two SSE routes - `GET /notifications` for customer notifications and `GET /admin/notifications` for admin notifications.

### Update Customer Template

Update `templates/customer.tmpl` to add SSE JavaScript:

```html
{{template "top" .}}
    <title>{{.Title}}</title>
    <style>
      @keyframes spin-slow {
        to { transform: rotate(360deg); }
      }
      .animate-spin-slow {
        animation: spin-slow 5s linear infinite;
      }
    </style>
</head>
<body class="bg-gradient-to-br from-amber-50 via-orange-50 to-rose-50 min-h-screen">
<div class="flex flex-col items-center p-6 md:p-8">
  <img src="/static/pizza.svg" class="w-48 h-48 mb-10 animate-spin-slow drop-shadow-lg" alt="Pizza loading...">

  <div id="statusContainer" class="bg-white/80 backdrop-blur-sm p-8 md:p-10 rounded-3xl shadow-2xl border border-white/20 max-w-3xl w-full">
    <h1 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4 text-center tracking-tight">
      Track Your Pizza Order
    </h1>
    <div class="text-lg text-gray-500 mb-10 text-center font-medium">
      Order #{{ .Order.ID }}
    </div>

    <div class="relative flex justify-between items-center mb-4">
      <div id="progressLine" class="absolute inset-x-[30px] h-1.5 bg-gray-200 top-1/2 -translate-y-1/2 rounded-full"></div>
      {{range $index, $status := .Statuses}}
      <div class="flex-1 flex justify-center relative mx-2">
        <div id="step{{add $index 1}}" class="size-14 bg-gray-300 rounded-full flex items-center justify-center text-white font-bold transition-all duration-300 z-10 shadow-md">
          {{add $index 1}}
        </div>
      </div>
      {{end}}
    </div>

    <div class="flex justify-between text-sm text-gray-700 mb-10 font-semibold">
      {{range .Statuses}}
      <span class="flex-1 text-center mx-2">{{.}}</span>
      {{end}}
    </div>

    <div class="bg-gray-50/60 p-6 rounded-2xl mb-6 border border-gray-100">
      <h2 class="text-xl font-semibold text-gray-800 mb-5">Order Details</h2>
      <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
        <div>
          <p class="text-sm text-gray-500 mb-1">Customer Name</p>
          <p class="font-semibold text-gray-900">{{ .Order.CustomerName }}</p>
        </div>
        <div>
          <p class="text-sm text-gray-500 mb-1">Phone</p>
          <p class="font-semibold text-gray-900">{{ .Order.Phone }}</p>
        </div>
        <div>
          <p class="text-sm text-gray-500 mb-1">Address</p>
          <p class="font-semibold text-gray-900">{{ .Order.Address }}</p>
        </div>
      </div>
    </div>

    <div class="bg-gray-50/60 p-6 rounded-2xl border border-gray-100">
      <h2 class="text-xl font-semibold text-gray-800 mb-5">Pizzas</h2>
      <div class="space-y-4">
        {{range $index, $pizza := .Order.Items}}
        <div class="border border-gray-200 rounded-xl p-5 bg-white/70">
          <h3 class="text-lg font-semibold text-gray-800 mb-4">
            Pizza #{{add $index 1}}
          </h3>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <p class="text-sm text-gray-500 mb-1">Type</p>
              <p class="font-semibold text-gray-900">{{ $pizza.Pizza }}</p>
            </div>
            <div>
              <p class="text-sm text-gray-500 mb-1">Size</p>
              <p class="font-semibold text-gray-900">{{ $pizza.Size }}</p>
            </div>
            <div class="md:col-span-2">
              <p class="text-sm text-gray-500 mb-1">Special Instructions</p>
              <p class="font-semibold text-gray-900">{{if $pizza.Instructions}}{{$pizza.Instructions}}{{else}}None{{end}}</p>
            </div>
          </div>
        </div>
        {{ end }}
      </div>
    </div>
  </div>
</div>

<script>
  const statuses = {{json .Statuses}};
  const orderId = "{{.Order.ID}}";

  function updateStatusBar(currentStatus) {
    const currentIndex = statuses.indexOf(currentStatus);
    statuses.forEach((status, index) => {
      const step = document.getElementById(`step${index + 1}`);
      if (index <= currentIndex) {
        step.classList.remove("bg-gray-300");
        step.classList.add("bg-emerald-500");
      }
    });

    const progressLine = document.getElementById("progressLine");
    const progressPercentage = Math.max((currentIndex / (statuses.length - 1)) * 100, 5);
    progressLine.style.background = `linear-gradient(to right, #10b981 ${progressPercentage}%, #e5e7eb ${progressPercentage}%)`;
  }

  updateStatusBar("{{.Order.Status}}");

  const eventSrc = new EventSource(`/notifications?orderId=${orderId}`);
  eventSrc.onmessage = () => location.reload();
  eventSrc.onerror = err => console.error("EventSource failed:", err);
</script>

{{template "bottom" .}}
```

**What changed:** We added JavaScript at the bottom that creates an EventSource connection to `/notifications?orderId={orderID}`. When a message arrives (admin updated the order status), the page automatically reloads to show the updated status.

**EventSource connection:** The `new EventSource()` creates a persistent connection to the server. When the order status changes, the server sends a message, and the `onmessage` handler reloads the page. The browser automatically reconnects if the connection drops.

**Why reload instead of updating in place:** Reloading is simpler and ensures customers see the exact current state without complex JavaScript to update the DOM. For a small app like this, the full page reload is fast and reliable.

### Update Admin Template

Update `templates/admin.tmpl` to add SSE JavaScript:

```html
{{template "top" .}}
    <title>Admin Dashboard - Pizza Tracker</title>
</head>
<body class="bg-gradient-to-br from-amber-50 via-orange-50 to-rose-50 min-h-screen">
<div class="container mx-auto px-4 py-8 md:py-12">
  <div class="max-w-[95%] mx-auto">
    <div class="flex justify-between items-center mb-8">
      <div>
        <h1 class="text-4xl md:text-5xl font-bold text-gray-900 mb-2 tracking-tight">Pizza Tracker</h1>
        <p class="text-gray-600 text-lg">Track and manage all your pizza orders</p>
      </div>
      <div class="flex items-center gap-4">
        <span class="text-gray-700 font-medium">Welcome, {{.Username}}</span>
        <form action="/logout" method="POST">
          <button type="submit" class="px-5 py-2.5 bg-red-500 text-white text-sm font-medium rounded-xl hover:bg-red-600 active:scale-95 transition-all shadow-sm">Logout</button>
        </form>
      </div>
    </div>

    <div class="bg-white/80 backdrop-blur-sm rounded-3xl shadow-xl border border-white/20 overflow-hidden">
      <div class="p-6 md:p-8">
          <div class="flex items-center mb-8">
            <h2 class="text-2xl font-semibold text-gray-900 mr-2">Active Orders</h2>
            <button onclick="location.reload()" class="text-gray-500 hover:text-gray-700 transition-colors ml-2 p-1.5 rounded-lg hover:bg-gray-100">
              <span class="text-xl">🔄</span>
            </button>
            <span id="lastFetched" class="text-sm text-gray-500 ml-4 font-medium"></span>
            <span id="newOrdersBadge" class="ml-2 text-xs font-semibold text-white bg-red-500 rounded-full px-3 py-1.5 hidden shadow-sm">0 new orders</span>
          </div>
          <div class="w-full overflow-x-auto rounded-xl border border-gray-200">
            <table class="w-full">
              <thead>
                <tr class="bg-gray-50/80 border-b border-gray-200">
                  <th class="px-6 py-4 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Order ID</th>
                  <th class="px-6 py-4 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Status</th>
                  <th class="px-6 py-4 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Name</th>
                  <th class="px-6 py-4 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Phone</th>
                  <th class="px-6 py-4 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Address</th>
                  <th class="px-6 py-4 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Pizzas</th>
                  <th class="px-6 py-4 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Actions</th>
                </tr>
              </thead>
              <tbody class="bg-white/70 divide-y divide-gray-100">
                {{range .Orders}}
                <tr class="hover:bg-gray-50/50 transition-colors">
                  <td class="px-6 py-4 whitespace-nowrap text-sm">
                    <a href="/customer/{{.ID}}" class="text-blue-600 hover:text-blue-700 font-medium hover:underline">{{.ID}}</a>
                  </td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700 font-medium">{{.Status}}</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">{{.CustomerName}}</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">{{.Phone}}</td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">{{.Address}}</td>
                  <td class="px-6 py-4 text-sm text-gray-700">
                    <div class="space-y-1">
                      {{range $index, $pizza := .Items}}
                      <div class="flex items-center gap-2">
                        <span class="text-gray-400">#{{add $index 1}}</span>
                        <span class="truncate">{{$pizza.Size}} {{$pizza.Pizza}}</span>
                        {{if $pizza.Instructions}}
                        <span class="size-4 text-gray-400 cursor-help" title="{{$pizza.Instructions}}">ⓘ</span>
                        {{end}}
                      </div>
                      {{end}}
                    </div>
                  </td>
                  <td class="px-6 py-4 whitespace-nowrap text-sm">
                    <div class="flex gap-2">
                      <form action="/admin/order/{{.ID}}/update" method="POST">
                        <select name="status" class="px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-emerald-400 focus:border-transparent transition-all bg-white font-medium" onchange="this.form.submit()">
                          {{$currentStatus := .Status}}
                          {{range $.Statuses}}
                          <option value="{{.}}" {{if eq . $currentStatus}}selected{{end}}>{{.}}</option>
                          {{end}}
                        </select>
                      </form>
                      <form action="/admin/order/{{.ID}}/delete" method="POST">
                        <button type="submit" class="p-2 text-white bg-red-500 rounded-lg hover:bg-red-600 active:scale-95 focus:outline-none focus:ring-2 focus:ring-red-400 transition-all" onclick="return confirm(''Are you sure you want to delete this order?'')">
                          <svg xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                          </svg>
                        </button>
                      </form>
                    </div>
                  </td>
                </tr>
                {{end}}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  document.addEventListener(''DOMContentLoaded'', () => {
    const updateTime = () => `Last updated on: ${new Date().toLocaleString()}`;
    const lastFetched = document.getElementById(''lastFetched'');
    const newOrdersBadge = document.getElementById(''newOrdersBadge'');

    lastFetched.textContent = updateTime();

    let newOrdersCount = 0;
    const eventSrc = new EventSource("/admin/notifications");
    eventSrc.onmessage = e => {
      newOrdersCount++;
      newOrdersBadge.textContent = `${newOrdersCount} new order${newOrdersCount === 1 ? '''' : ''s''}`;
      newOrdersBadge.classList.remove(''hidden'');
      lastFetched.textContent = updateTime();
    };
    eventSrc.onerror = err => console.error("EventSource failed:", err);
  });
</script>

{{template "bottom" .}}
```

**What changed:** We added JavaScript that connects to `/admin/notifications` using EventSource. When a new order arrives, a red badge appears showing how many new orders since the page loaded. We also show a "Last updated" timestamp.

**Real-time notifications:** The JavaScript at the bottom connects to `/admin/notifications` using EventSource. When a new order arrives, the badge appears showing how many new orders since the page loaded. This gives admins immediate visibility without polling or manual refresh.

**Why not auto-reload on new orders:** The badge notification is better UX than auto-reloading the page because admins might be in the middle of updating an order or reading customer information. The badge alerts them to new orders without disrupting their workflow. They can click the refresh button when ready.

### Test Real-Time Updates

Start your server:

```bash
go run cmd/*.go
```

**Test customer notifications:**

1. Place a new order at `http://localhost:8080`
2. After submission, you''ll be on the tracking page showing "Order Placed" status
3. Keep this browser tab open
4. In another tab or incognito window, log in as admin at `http://localhost:8080/login`
5. Find your order in the admin dashboard
6. Change the order status from "Order Placed" to "Preparing" using the dropdown
7. Switch back to the tracking page tab - it should automatically reload and show "Preparing" with the progress bar updated

**Test admin notifications:**

1. Log in to the admin dashboard at `http://localhost:8080/admin`
2. Keep this tab open
3. In another tab or incognito window, place a new order at `http://localhost:8080`
4. Switch back to the admin dashboard - you should see a red badge appear with "1 new order"
5. Click the refresh button to see the new order in the table
6. Place another order - the badge should update to "2 new orders"

**Debugging SSE:**

Open your browser''s Developer Tools (F12), go to the Network tab, and look for connections to `/notifications` or `/admin/notifications`. These connections stay open (Status shows "pending" or keeps streaming). When you trigger notifications, you''ll see messages appear in the response.

If SSE isn''t working:

- Check that the notification manager is initialized in the Handler constructor
- Verify the event handlers are registered in routes
- Look for "client disconnected" logs when closing browser tabs
- Make sure notifications use the correct key format (`"order:{id}"` or `"admin:new_orders"`)
- Check browser console for JavaScript errors

the Real-Time Updates section is complete! Your pizza tracker now has real-time updates. Customer tracking pages automatically reload when admins change order status, and the admin dashboard shows instant notifications when new orders arrive.

## Production Deployment

Your pizza tracker is complete! Here''s how to deploy it to production.

### Environment Variables

The app reads configuration from environment variables with sensible defaults:

- `PORT` - Server port (default: 8080)
- `DATABASE_URL` - SQLite database file path (default: ./data/orders.db)
- `SESSION_SECRET_KEY` - Secret key for encrypting session cookies (default: pizza-order-secret-key)

### Build for Production

Compile a production binary:

```bash
go build -o pizza-tracker cmd/*.go
```

This creates a single executable named `pizza-tracker` that you can deploy anywhere Go runs.

### Deploy to Railway

Railway is a platform that makes deploying Go apps simple. We''ll use the Railway CLI to deploy directly from your local machine.

Install the Railway CLI:

```bash
npm i -g @railway/cli
```

Log in to Railway:

```bash
railway login
```

This opens your browser to authenticate with Railway. Once logged in, initialize your project:

```bash
railway init
```

This creates a new Railway project and links your local directory to it. Railway generates a unique project name, but you can rename it later in the Railway dashboard.

Railway will automatically detect your Go application and build it using Nixpacks - no configuration file needed.

Set environment variables for production:

```bash
railway variables --set PORT=8080
railway variables --set DATABASE_URL=/data/orders.db
railway variables --set SESSION_SECRET_KEY=$(openssl rand -base64 32)
```

The `SESSION_SECRET_KEY` is used to encrypt session cookies. We generate a random 32-byte key using `openssl`. Railway automatically restarts your service when you set environment variables, so the new values take effect immediately.

Create a volume to persist the SQLite database across deployments:

```bash
railway volume add --name pizza-data --mount /data
```

**Why volumes are critical:** Railway containers are ephemeral - they''re destroyed and recreated on each deployment. Without a volume, you''d lose all orders and user data on every deploy. The volume persists the `/data` directory (where our SQLite database lives) across deployments.

Deploy your app:

```bash
railway up
```

This builds your app, uploads it to Railway, and deploys it. You''ll see build logs in your terminal. Once complete, Railway assigns a public URL to your app.

Get your app''s URL:

```bash
railway domain
```

If no domain is assigned, generate one:

```bash
railway domain --generate
```

Railway creates a URL like `https://pizza-tracker-production.up.railway.app`. Visit this URL to see your deployed pizza tracker.

### Create Admin User in Production

Before you can log in to the admin dashboard, you need to create an admin user in the production database. Railway lets you connect directly to your deployed container and run commands.

First, generate a bcrypt hash for your admin password. Visit https://bcrypt-generator.com/ and enter a strong password. Copy the generated hash.

Connect to your Railway container:

```bash
railway run bash
```

This opens a shell inside your running container. Now create the admin user using sqlite3:

```bash
sqlite3 /data/orders.db ''INSERT INTO users (id, username, password) VALUES ("admin-user", "admin", "$2a$12$YOUR_BCRYPT_HASH_HERE");''
```

Replace `$2a$12$YOUR_BCRYPT_HASH_HERE` with the hash you generated. Make sure to wrap it in single quotes to prevent shell interpretation.

Verify the user was created:

```bash
sqlite3 -header -column /data/orders.db "SELECT * FROM users;"
```

You should see your admin user listed. Exit the container:

```bash
exit
```

Now visit your Railway URL and go to `/login`. Log in with username `admin` and the password you used to generate the bcrypt hash.

**Alternative method:** If `sqlite3` isn''t available in the container, you can run SQL commands through your Go app by temporarily adding a setup route or using Railway''s shell feature in the web dashboard.

### Security Checklist

Before going live:

- **Change the admin password** - Use a strong randomly-generated password stored in an environment variable
- **Session security** - Already configured with:
  - Database-backed persistent sessions (survives restarts)
  - 24-hour session lifetime
  - HttpOnly cookies (XSS protection)
  - SameSite=Strict (CSRF protection)
  - Secure cookies for HTTPS (required in production)
- **Rate limiting** - Add rate limiting middleware to prevent abuse of the order submission form
- **Input sanitization** - While we validate input, consider additional sanitization for database queries
- **Database backups** - Set up regular backups of the SQLite database file (includes both orders and sessions)

## What You''ve Built

You''ve created a production-ready pizza ordering and tracking system with:

- **Customer order form** with dynamic pizza selection and validation
- **Real-time order tracking** with visual progress indicators
- **Admin authentication** using bcrypt and database-backed sessions
- **Persistent session storage** using SQLite (survives restarts)
- **Admin dashboard** with order management
- **Server-Sent Events** for live updates without polling
- **SQLite database** with GORM ORM
- **Clean architecture** with handlers, models, and middleware
- **Production-ready security** with HttpOnly, SameSite, and Secure cookies

The app demonstrates modern web development patterns in Go: dependency injection via handler structs, middleware for cross-cutting concerns, struct-based form validation, template composition, and real-time communication with SSE.

## Next Steps

Ideas for extending the app:

- **Order history** - Let customers view past orders by phone number or email
- **Email notifications** - Send confirmation emails when orders are placed or ready
- **Estimated delivery time** - Calculate and display expected delivery based on order status
- **Menu management** - Let admins add/remove pizza types and customize the menu
- **Analytics dashboard** - Show order volume, popular pizzas, and average preparation time
- **Multi-location support** - Handle multiple restaurant locations with separate admin dashboards
- **Customer accounts** - Add registration and login for customers to track multiple orders
- **Mobile app** - Build a mobile app that consumes a JSON API version of the backend

The foundation you''ve built is solid and extensible. Each of these features can be added by following the same patterns: create models, write handlers, add routes, and build templates.
', NULL, NULL, '1', 'Ready to get started?', 'Get instant access to all content and downloads', 'Buy Now', '1', '1', '0', '1', '0', '1763720100000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '1759699514240', '1763818522434'),
('cmgpbc8q10000y4jh9oshecxq', 'best-web-framework-go', 'What Is the Best Web Framework for Go?', 'What is the best Go (Golang) web framework? This guide compares Gin, Echo, Fiber, Beego, and more. Based on performance, use cases, features, learning curve, and community support.', '0', 'NONE', NULL, '/images/best-web-framework-go.png', NULL, NULL, NULL, 'Go''s ecosystem has exploded with web frameworks over the past few years. Whether you''re building a REST API or a full-stack solution, there''s likely a framework tailored to your needs.

**What this article covers:**  
 We''ll walk through the top Go frameworks, compare their features, performance, community support, and use cases. This will help you figure out which one fits your project best.


## How to Choose the Right Go Framework

Before diving into individual frameworks, here are some key factors to consider:

- **Project Type**  
  Are you building a REST API, microservice, monolithic app, or a full-stack enterprise solution?

- **Performance Needs**  
  Do you need to handle millions of requests per second, or is development speed more important?

- **Development Speed vs. Flexibility**  
  Some frameworks are opinionated and offer rapid development. Others give you more control but require more setup.

- **Community & Ecosystem**  
  A vibrant community means better documentation, more plugins, and faster bug fixes.

- **Learning Curve**  
  Consider your team''s experience and familiarity with Go and similar web frameworks.

## Top Go Frameworks

### Gin: The Fast, Popular Workhorse

![Gin framework: The Fast, Popular Workhorse](/images/go-gin-framework.png)

**Brief description:**  
Gin is the most widely adopted web framework in the Go ecosystem. It''s designed for speed and simplicity, and it''s particularly well-suited for building high-performance REST APIs.

**Key features:**

- Fast HTTP router
- Middleware support
- Built-in JSON rendering and validation
- Error handling and logging out of the box
- Extensive documentation and active community

**Pros & Cons:**

✅ Blazing fast performance  
✅ Minimalist, low-overhead design  
✅ Large community and mature ecosystem

❌ Less opinionated, you''ll assemble more by hand  
❌ Lacks full-stack utilities like ORM or template engines

**Ideal use cases:**

- High-performance REST APIs
- Microservices
- Applications needing minimal latency

**GitHub stats + resources:**

- ⭐ [Gin on GitHub](https://github.com/gin-gonic/gin) (80k+ stars)
- 📘 [Gin Examples and Docs](https://github.com/gin-gonic/examples)

### Echo: Clean, Lightweight, and Scalable

![Echo framework: Clean, Lightweight, and Scalable](/images/go-echo-framework.png)

**Brief description:**  
Echo is a high-performance, extensible framework with a minimal footprint. It excels in building scalable RESTful APIs and microservices with clean code and structured organization.

**Key features:**

- Lightweight, fast router
- Built-in middleware for logging, CORS, etc.
- Automatic binding for JSON/XML/Form data
- Centralized error handling
- Intuitive API design

**Pros & Cons:**

✅ Clean, structured codebase  
✅ Easy to extend and customize  
✅ Active ecosystem with good documentation

❌ Smaller ecosystem compared to Gin  
❌ Less full-featured out-of-the-box for large apps

**Ideal use cases:**

- Lightweight APIs
- Scalable microservices
- Projects where structure and clarity are priorities

**GitHub stats + resources:**

- ⭐ [Echo on GitHub](https://github.com/labstack/echo) (30k+ stars)
- 📘 [Echo Documentation](https://echo.labstack.com/docs)

### Beego: All-in-One MVC for Enterprises

![Beego framework: All-in-One MVC for Enterprises](/images/go-beego-framework.png)

**Brief description:**  
Beego is a full-featured MVC framework inspired by Django and Rails. It offers built-in ORM, routing, sessions, and a CLI. It''s ideal for enterprise-grade, full-stack Go applications.

**Key features:**

- MVC architecture with strong separation of concerns
- Built-in ORM and web server
- Code generation and CLI tools
- Integrated logging and session management

**Pros & Cons:**

✅ Enterprise-ready toolchain  
✅ Built-in scaffolding for rapid development  
✅ Good documentation and legacy use

❌ Heavier learning curve  
❌ Less active than Gin or Echo in recent years

**Ideal use cases:**

- Enterprise apps
- Admin dashboards
- Full-stack monoliths

**GitHub stats + resources:**

- ⭐ [Beego on GitHub](https://github.com/beego/beego) (30k+ stars)
- 📘 [Beego Documentation](https://doc.meoying.com/en-US/beego/developing/)

### Fiber: Lightning Fast and Express-Inspired

![Fiber framework: Lightning Fast and Express-Inspired](/images/go-fiber-framework.png)

**Brief description:**  
Fiber is a modern web framework built on top of FastHTTP, Go''s fastest HTTP engine. Inspired by Express.js, it offers an intuitive API and top performance.

**Key features:**

- Express-style API for fast onboarding
- Low memory footprint
- Static file handling
- Built-in middleware system
- Built on FastHTTP for speed

**Pros & Cons:**

✅ Top performance  
✅ Great for Express.js developers transitioning to Go  
✅ Active community and rapid development

❌ Not compatible with `net/http` standard  
❌ Smaller ecosystem and fewer integrations

**Ideal use cases:**

- Real-time services
- High-throughput microservices
- Developers familiar with Express.js

**GitHub stats + resources:**

- ⭐ [Fiber on GitHub](https://github.com/gofiber/fiber) (35k+ stars)
- 📘 [Fiber Docs](https://docs.gofiber.io)

## Honorable Mentions

- **`net/http` ServeMux (Standard Library):**  
      Go''s built-in `http.ServeMux` is minimal, fast, and rock-solid. It supports basic routing via path matching and allows handling different HTTP methods. it''s a great starting point and perfectly suitable for small services, internal tools, or projects that value zero dependencies.  
      👉 [Official `net/http` documentation](https://pkg.go.dev/net/http)

- **[Gorilla Mux](https://github.com/gorilla/mux):**  
  A robust HTTP router with powerful matching rules. Not a full framework, but widely used in custom Go setups.

- **[Revel](https://github.com/revel/revel):**  
  A full-stack framework with hot reload and code generation. Great for rapid prototyping.

- **[Go Kit](https://github.com/go-kit/kit):**  
  A toolkit for building reliable, maintainable microservices. Focused more on architecture than web-specific needs.

- **[Buffalo](https://github.com/gobuffalo/buffalo):**  
  A "Rails for Go" framework, includes everything from front-end tools to database migrations. Excellent for rapid development. (Sadly, it''s not maintained anymore.)

## Feature Breakdown

### 💡 Overview

| Framework    | Performance | Features | Community  | Onboarding    | Best Use Case                     |
| ------------ | ----------- | -------- | ---------- | ------------- | --------------------------------- |
| **Gin**      | ⭐⭐⭐⭐⭐  | ⭐⭐⭐   | ⭐⭐⭐⭐⭐ | ⭐⭐ Easy     | REST APIs, microservices          |
| **Echo**     | ⭐⭐⭐⭐⭐  | ⭐⭐⭐   | ⭐⭐⭐     | ⭐⭐ Easy     | Scalable APIs, clean architecture |
| **Fiber**    | ⭐⭐⭐⭐⭐  | ⭐⭐⭐   | ⭐⭐⭐     | ⭐⭐ Easy     | Real-time apps, Express.js style  |
| **Beego**    | ⭐⭐⭐      | ⭐⭐⭐⭐ | ⭐⭐⭐     | ⭐⭐⭐ Medium | Enterprise-grade full-stack apps  |
| **Buffalo**  | ⭐⭐        | ⭐⭐⭐⭐ | ⭐⭐       | ⭐⭐ Medium   | Full-stack apps with front-end    |
| **Go Kit**   | ⭐⭐⭐      | ⭐⭐     | ⭐         | ⭐⭐⭐ Hard   | Large-scale microservices         |
| **ServeMux** | ⭐⭐⭐      | ⭐       | ⭐⭐⭐     | ⭐ Easy       | Internal tools, zero-dependency   |

### 🚀 Features

| Framework    | Advanced Routing | Middleware | ORM | CLI Tools | Template Engine |
| ------------ | ---------------- | ---------- | --- | --------- | --------------- |
| **Gin**      | ✅               | ✅         | ❌  | ❌        | ❌              |
| **Echo**     | ✅               | ✅         | ❌  | ❌        | ❌              |
| **Fiber**    | ✅               | ✅         | ❌  | ❌        | ❌              |
| **Beego**    | ✅               | ✅         | ✅  | ✅        | ✅              |
| **Buffalo**  | Moderate         | ✅         | ✅  | ✅        | ✅              |
| **Go Kit**   | ✅               | ⚠️ Manual  | ❌  | ❌        | ❌              |
| **ServeMux** | Basic            | ⚠️ Manual  | ❌  | ❌        | ❌              |

## Conclusion: What''s the Best Framework for You?

Choosing the best framework depends on what you''re building:

- **🏆 Best All-Rounder:** Gin  
  Fast, battle-tested, and minimal. Perfect for REST APIs and microservices.

- **✨ Most Elegant:** Echo  
  Clean structure, great for scalable APIs with modern code practices.

- **⚡ Fastest & Express-like:** Fiber  
  Wins on raw speed and familiar syntax if you''re coming from Express.js.

- **🏢 Enterprise-Ready:** Beego  
  Is your go to if you want everything baked in: MVC, ORM, and tooling.

- **🔧 Barebones Simplicity:** ServeMux  
  Great for tiny services or when you want zero dependencies.

💡 **Final take:**  
 The best framework is the one that fits your needs.

Here''s a list of Go web frameworks ranked by GitHub stars: [Go Web Framework Stars – mingrammer](https://github.com/mingrammer/go-web-framework-stars)
', NULL, NULL, '1', 'Ready to get started?', 'Get instant access to all content and downloads', 'Buy Now', '1', '1', '0', '0', '0', '1746075600000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '1760370828842', '1763815373809'),
('cmgpgmdfh0000y4c7364f1aga', 'how-to-build-a-cli-todo-app-in-go', 'How to Build A CLI Todo App in Go', 'In this tutorial, we are gonna create a CLI To-Do app using Go (Golang).', '0', 'NONE', 'g16Zf0KQEWI?si=_gv-sJSfAaDVWBvG', '/images/go-cli-todo-app-thumb.png', NULL, NULL, '## Introduction

In this tutorial, I''m going to show you how to create a CLI To-Do app using Go (Golang).

We''ll build this application from the ground up, and by the end, you’ll have a working command-line tool where you can manage your todos.

You’ll gain practical experience in working with flag arguments to parse command-line inputs and handling JSON data for storing and reading your todos directly from a JSON file.

![Go CLI Todo App](/images/go-cli-todo-app.png)

## Setup

### Main File Setup

Create a `main.go` file with package main & a main function. For now we can just print out something we will come back to it later.

```go
package main

import "fmt"

func main() {
    fmt.Println("Inside main in todo app")
}
```

### Todo Structure

Create a `todo.go` here we will define the todo structure & functionality.

```go
type Todo struct {
    Title       string
    Completed   bool
    CreatedAt   time.Time
    CompletedAt *time.Time
}
```

These are all the fields we will need for a todo. We also need a slice that will hold all our todos.

```go
type Todos []Todo
```

## Todo Functionality

We are now gonna implement all the methods lets start by creating the add method.

```go
func (todos *Todos) add(title string) {
    todo := Todo{
        Title:       title,
        Completed:   false,
        CompletedAt: nil,
        CreatedAt:   time.Now(),
    }

    *todos = append(*todos, todo)
}
```

In this method, we create a new to-do item by setting it''s title and marking it as not completed, with the creation date set to the current time. We then add this new todo directly to the existing list of to-dos using a pointer (`*todos`). This pointer allows us to access and modify the original list stored in memory.

After that we gonna add a helper method that checks if the provided index for operations like remove, edit, or toggle is valid

```go
func (todos *Todos) validateIndex(index int) error {
    if index < 0 || index >= len(*todos) {
        err := errors.New("invalid index")
        fmt.Println(err.Error())
        return err
    }
    return nil
}
```

If the index is out of bounds, it prints an ''invalid index'' error and returns it. Otherwise, it returns nil, indicating the index is valid.

The next method we will implement is the delete method

```go
func (todos *Todos) delete(index int) error {
    t := *todos
    if err := t.validateIndex(index); err != nil {
        return err
    }

    *todos = append(t[:index], t[index+1:]...)

    return nil
}
```

In the `delete` method, we first verify the provided index using our helper method to ensure it is within the valid range. If the index is valid, we remove the to-do item by splitting the list at the specified index. We then join the two sections before and after the index, which removes the item from the list.

## Running the App

To see our to-do application in action, let''s open the `main.go` file and run a quick test.

```go
package main

import "fmt"

func main() {
    todos := Todos{}
    todos.add("Buy Milk")
    todos.add("Buy Bread")
    fmt.Printf("%+v\n\n", todos)
    todos.delete(0)
    fmt.Printf("%+v", todos)
}
```

This allows us to add items to our to-do list and remove them as needed. Next, we''ll enhance the functionality by adding the ability to toggle a to-do''s completion status.

```go
func (todos *Todos) toggle(index int) error {
    t := (*todos)
    if err := t.validateIndex(index); err != nil {
        return err
    }

    isCompleted := t[index].Completed

    if !isCompleted {
        completionTime := time.Now()
        t[index].CompletedAt = &completionTime
    }

    t[index].Completed = !isCompleted

    return nil
}
```

In the `toggle` method, we start by dereferencing the `todos` pointer and validating the provided index to ensure it is within the correct range. If the item at this index is not already completed, we mark the current time as its completion time. We then flip the `Completed` status. If it was `false` (not completed), it becomes `true` (completed), and vice versa.

Next we have the edit metod.

```go
func (todos *Todos) edit(index int, title string) error {
t := *todos

if err := t.validateIndex(index); err != nil {
	return err
}

t[index].Title = title

return nil
}
```

Same as the other methods we validate the index if it''s valed get the todo from the todos slice and update the tile.

The final method we need for our to-do list is a way to display it neatly. We''ll use a third-party package to create a visually appealing table. First, install the package by running the following command in the terminal.

`Go get github.com/aquasecurity/table`

Next, we''ll create a method called `print`.

```go
func (todos *Todos) print() {
    table := table.New(os.Stdout)
    table.SetRowLines(false)
    table.SetHeaders("#", "Title", "Completed", "Created At", "Completed At")

    for index, t := range *todos {
        completed := "❌"
        completedAt := ""
       
        if t.Completed {
            completed = "✅"
            if t.CompletedAt != nil {
                completedAt = t.CompletedAt.Format(time.RFC1123)

            }

        }

        table.AddRow(strconv.Itoa(index), t.Title, completed, t.CreatedAt.Format(time.RFC1123), completedAt)

    }

    table.Render()
}
```

In this method, we set up a new table directed to output in the console. We configure the table by turning off row lines and setting column headers.

Then, we loop through each to-do item. If an item is completed, we mark it with a checkmark and include the completion date. Otherwise, we use a cross mark and leave the completion date blank. Each to-do item is added as a row in the table with its details.

Finally, we render the table to the console.

Here is the full code for the `todo.go`

```go
package main

import (
	"errors"
	"fmt"
	"os"
	"strconv"
	"time"

	"github.com/aquasecurity/table"
)

type Todo struct {
	Title       string
	Completed   bool
	CreatedAt   time.Time
	CompletedAt *time.Time
}

type Todos []Todo

func (todos *Todos) add(title string) {
	todo := Todo{
		Title:       title,
		Completed:   false,
		CompletedAt: nil,
		CreatedAt:   time.Now(),
	}

	*todos = append(*todos, todo)
}

func (todos *Todos) validateIndex(index int) error {
	if index < 0 || index >= len(*todos) {
		err := errors.New("invalid index")
		fmt.Println(err)
		return err
	}

	return nil
}

func (todos *Todos) delete(index int) error {
	t := *todos

	if err := t.validateIndex(index); err != nil {
		return err
	}

	*todos = append(t[:index], t[index+1:]...)

	return nil
}

func (todos *Todos) toggle(index int) error {
	t := *todos

	if err := t.validateIndex(index); err != nil {
		return err
	}

	isCompleted := t[index].Completed

	if !isCompleted {
		completionTime := time.Now()
		t[index].CompletedAt = &completionTime
	}

	t[index].Completed = !isCompleted

	return nil
}

func (todos *Todos) edit(index int, title string) error {
	t := *todos

	if err := t.validateIndex(index); err != nil {
		return err
	}

	t[index].Title = title

	return nil
}

func (todos *Todos) print() {
	table := table.New(os.Stdout)
	table.SetRowLines(false)
	table.SetHeaders("#", "Title", "Completed", "Created At", "Completed At")
	for index, t := range *todos {
		completed := "❌"
		completedAt := ""

		if t.Completed {
			completed = "✅"
			if t.CompletedAt != nil {
				completedAt = t.CompletedAt.Format(time.RFC1123)
			}
		}

		table.AddRow(strconv.Itoa(index), t.Title, completed, t.CreatedAt.Format(time.RFC1123), completedAt)
	}

	table.Render()
}

```

Lets’ try it out.

```go
package main

func main() {
    todos := Todos{}
    todos.add("Buy Milk")
    todos.add("Buy Bread")
    todos.toggle(0)
    todos.print()
}
```

We start by adding a couple of tasks: ''Buy Milk'' and ''Buy Bread''. Next, we toggle the completion status of the first item to mark it as complete. Then, we use the `print` method to display our tasks in a structured table.

It would be nice to have functionality to save our to-do list to a file and read it back from there, keeping our data persistent between sessions. Let’s implement that next.

Create a file called `storage.go`

```go
import (
    "encoding/json"
    "os"
)

type Storage[T any] struct {
    FileName string
}

func NewStorage[T any](fileName string) *Storage[T] {
    return &Storage[T]{FileName: fileName}
}

func (s *Storage[T]) Save(data T) error {
    fileData, err := json.MarshalIndent(data, "", "")
   
    if err != nil {
        return err
    }
   
    return os.WriteFile(s.FileName, fileData, 0644)
}

func (s *Storage[T]) Load(data *T) error {
    fileData, err := os.ReadFile(s.FileName)
   
    if err != nil {
        return err
    }

    return json.Unmarshal(fileData, data)
}
```

This code defines a `Storage` structure to manage file operations generically, which means it can handle any type, such as our to-do list or other data types in the future.

In the `NewStorage` We initiate a `Storage` instance with a specified file name.

The save function takes any data of type `T` and saves it into a file in JSON format. It neatly formats the JSON for better readability and sets appropriate file permissions.

The load function retrieves data from the specified file and converts the JSON back into our data structure of type `T`.

Lets try it out

```go
package main

func main() {
    todos := Todos{}
    storage := NewStorage[Todos]("todos.json")
    storage.Load(&todos)
    todos.add("Buy Milk")
    todos.add("Buy Bread")
    todos.toggle(0)
    todos.print()
    storage.Save(todos)
}
```

We start by creating a new storage with the Todos type & the file name `todos.json`. This file doesn’t exist, so the `Load` function won’t find any data to load. We then add some todos to our list and save them. This process creates the `todos.json` file with our new data. If we run the program again, it will load the todos from this file back into the program.

The last part that is missing is to be able to run the program with different commands. Create a new file called `command.go`

```go
package main

import (
    "flag"
    "fmt"
    "os"
    "strconv"
    "strings"
)

type CmdFlags struct {
    Add    string
    Del    int
    Edit   string
    Toggle int
    List   bool
}

func NewCmdFlags() *CmdFlags {
    cf := CmdFlags{}
   
    flag.StringVar(&cf.Add, "add", "", "Add a new todo specify title")
    flag.StringVar(&cf.Edit, "edit", "", "Edit a todo by index & specify a new title. id:new_title")
    flag.IntVar(&cf.Del, "del", -1, "Specify todo by index to delete")
    flag.IntVar(&cf.Toggle, "toggle", -1, "Specify todo by index to toggle complete true/false")
    flag.BoolVar(&cf.List, "list", false, "List all todos")
   
    flag.Parse()
   
    return &cf
}

```

This block of code sets up the structure with all available commands and initializes the command-line flags. Each flag is defined with a specific type, a pointer to the data, a default value, and a description. We then parse these flags to populate the `CmdFlags` structure.

Next, we implement an `Execute` function that evaluates the values in `CmdFlags` and invokes the corresponding method from the `Todos` structure

```go

func (cf *CmdFlags) Execute(todos *Todos) {
    switch {
    case cf.List:
        todos.print()
    case cf.Add != "":
        todos.add(cf.Add)
    case cf.Edit != "":
        parts := strings.SplitN(cf.Edit, ":", 2)
        if len(parts) != 2 {
            fmt.Println("Error: Invalid format for edit. Please use index:new_title")
            os.Exit(1)
        }
        index, err := strconv.Atoi(parts[0])
        if err != nil {
            fmt.Println("Error: Invalid index for edit.")
            os.Exit(1)

        }
        todos.edit(index, parts[1])
    case cf.Toggle != -1:
        todos.toggle(cf.Toggle)

    case cf.Del != -1:
        todos.delete(cf.Del)

    default:
        fmt.Println("Invalid command")
    }
}
```

This function checks each flag in the `CmdFlags` to see which action should be performed,

Here is the full code for the `command.go`

```go
package main

import (
	"flag"
	"fmt"
	"os"
	"strconv"
	"strings"
)

type CmdFlags struct {
	Add    string
	Del    int
	Edit   string
	Toggle int
	List   bool
}

func NewCmdFlags() *CmdFlags {
	cf := CmdFlags{}

	flag.StringVar(&cf.Add, "add", "", "Add a new todo specify title")
	flag.StringVar(&cf.Edit, "edit", "", "Edit a todo by index & specify a new title. id:new_title")
	flag.IntVar(&cf.Del, "del", -1, "Specify a todo by index to delete")
	flag.IntVar(&cf.Toggle, "toggle", -1, "Specify a todo by index to toggle")
	flag.BoolVar(&cf.List, "list", false, "List all todos")

	flag.Parse()

	return &cf
}

func (cf *CmdFlags) Execute(todos *Todos) {
	switch {
	case cf.List:
		todos.print()
	case cf.Add != "":
		todos.add(cf.Add)
	case cf.Edit != "":
		parts := strings.SplitN(cf.Edit, ":", 2)
		if len(parts) != 2 {
			fmt.Println("Error, invalid format for edit. Please use id:new_title")
			os.Exit(1)
		}

		index, err := strconv.Atoi(parts[0])

		if err != nil {
			fmt.Println("Error: invalid index for edit")
			os.Exit(1)
		}

		todos.edit(index, parts[1])

	case cf.Toggle != -1:
		todos.toggle(cf.Toggle)

	case cf.Del != -1:
		todos.delete(cf.Del)

	default:
		fmt.Println("Invalid command")
	}
}
```

Finally, we update the `main.go` file to integrate these changes

```go
package main

func main() {
todos := Todos{}

storage := NewStorage[Todos]("todos.json")
storage.Load(&todos)

cmdFlags := NewCmdFlags()
cmdFlags.Execute(&todos)

storage.Save(todos)
}
```

In the main function, we initialize the `Todos` and `Storage`, load any existing todos from a file, process commands based on user input, and then save any changes back to the file.

Full source code can be found here [Github](https://github.com/patni1992/CLI-Todo-App-In-Go)

## Conclusion

We''ve reached the end of our tutorial on how to build a CLI to-do application using Go. Feel free to expand on what we''ve covered by adding new features or enhancing existing ones to make the app even more robust. Thank you for joining me today. See you in the next video!
', '## Introduction

In this tutorial, I''m going to show you how to create a CLI To-Do app using Go (Golang).

We''ll build this application from the ground up, and by the end, you’ll have a working command-line tool where you can manage your todos.

You’ll gain practical experience in working with flag arguments to parse command-line inputs and handling JSON data for storing and reading your todos directly from a JSON file.

![Go CLI Todo App](/images/go-cli-todo-app.png)

## Setup

### Main File Setup

Create a `main.go` file with package main & a main function. For now we can just print out something we will come back to it later.

```go
package main

import "fmt"

func main() {
    fmt.Println("Inside main in todo app")
}
```

### Todo Structure

Create a `todo.go` here we will define the todo structure & functionality.

```go
type Todo struct {
    Title       string
    Completed   bool
    CreatedAt   time.Time
    CompletedAt *time.Time
}
```

These are all the fields we will need for a todo. We also need a slice that will hold all our todos.

```go
type Todos []Todo
```

## Todo Functionality

We are now gonna implement all the methods lets start by creating the add method.

```go
func (todos *Todos) add(title string) {
    todo := Todo{
        Title:       title,
        Completed:   false,
        CompletedAt: nil,
        CreatedAt:   time.Now(),
    }

    *todos = append(*todos, todo)
}
```

In this method, we create a new to-do item by setting it''s title and marking it as not completed, with the creation date set to the current time. We then add this new todo directly to the existing list of to-dos using a pointer (`*todos`). This pointer allows us to access and modify the original list stored in memory.

After that we gonna add a helper method that checks if the provided index for operations like remove, edit, or toggle is valid

```go
func (todos *Todos) validateIndex(index int) error {
    if index < 0 || index >= len(*todos) {
        err := errors.New("invalid index")
        fmt.Println(err.Error())
        return err
    }
    return nil
}
```

If the index is out of bounds, it prints an ''invalid index'' error and returns it. Otherwise, it returns nil, indicating the index is valid.

The next method we will implement is the delete method

```go
func (todos *Todos) delete(index int) error {
    t := *todos
    if err := t.validateIndex(index); err != nil {
        return err
    }

    *todos = append(t[:index], t[index+1:]...)

    return nil
}
```

In the `delete` method, we first verify the provided index using our helper method to ensure it is within the valid range. If the index is valid, we remove the to-do item by splitting the list at the specified index. We then join the two sections before and after the index, which removes the item from the list.

## Running the App

To see our to-do application in action, let''s open the `main.go` file and run a quick test.

```go
package main

import "fmt"

func main() {
    todos := Todos{}
    todos.add("Buy Milk")
    todos.add("Buy Bread")
    fmt.Printf("%+v\n\n", todos)
    todos.delete(0)
    fmt.Printf("%+v", todos)
}
```

This allows us to add items to our to-do list and remove them as needed. Next, we''ll enhance the functionality by adding the ability to toggle a to-do''s completion status.

```go
func (todos *Todos) toggle(index int) error {
    t := (*todos)
    if err := t.validateIndex(index); err != nil {
        return err
    }

    isCompleted := t[index].Completed

    if !isCompleted {
        completionTime := time.Now()
        t[index].CompletedAt = &completionTime
    }

    t[index].Completed = !isCompleted

    return nil
}
```

In the `toggle` method, we start by dereferencing the `todos` pointer and validating the provided index to ensure it is within the correct range. If the item at this index is not already completed, we mark the current time as its completion time. We then flip the `Completed` status. If it was `false` (not completed), it becomes `true` (completed), and vice versa.

Next we have the edit metod.

```go
func (todos *Todos) edit(index int, title string) error {
t := *todos

if err := t.validateIndex(index); err != nil {
	return err
}

t[index].Title = title

return nil
}
```

Same as the other methods we validate the index if it''s valed get the todo from the todos slice and update the tile.

The final method we need for our to-do list is a way to display it neatly. We''ll use a third-party package to create a visually appealing table. First, install the package by running the following command in the terminal.

`Go get github.com/aquasecurity/table`

Next, we''ll create a method called `print`.

```go
func (todos *Todos) print() {
    table := table.New(os.Stdout)
    table.SetRowLines(false)
    table.SetHeaders("#", "Title", "Completed", "Created At", "Completed At")

    for index, t := range *todos {
        completed := "❌"
        completedAt := ""
       
        if t.Completed {
            completed = "✅"
            if t.CompletedAt != nil {
                completedAt = t.CompletedAt.Format(time.RFC1123)

            }

        }

        table.AddRow(strconv.Itoa(index), t.Title, completed, t.CreatedAt.Format(time.RFC1123), completedAt)

    }

    table.Render()
}
```

In this method, we set up a new table directed to output in the console. We configure the table by turning off row lines and setting column headers.

Then, we loop through each to-do item. If an item is completed, we mark it with a checkmark and include the completion date. Otherwise, we use a cross mark and leave the completion date blank. Each to-do item is added as a row in the table with its details.

Finally, we render the table to the console.

Here is the full code for the `todo.go`

```go
package main

import (
	"errors"
	"fmt"
	"os"
	"strconv"
	"time"

	"github.com/aquasecurity/table"
)

type Todo struct {
	Title       string
	Completed   bool
	CreatedAt   time.Time
	CompletedAt *time.Time
}

type Todos []Todo

func (todos *Todos) add(title string) {
	todo := Todo{
		Title:       title,
		Completed:   false,
		CompletedAt: nil,
		CreatedAt:   time.Now(),
	}

	*todos = append(*todos, todo)
}

func (todos *Todos) validateIndex(index int) error {
	if index < 0 || index >= len(*todos) {
		err := errors.New("invalid index")
		fmt.Println(err)
		return err
	}

	return nil
}

func (todos *Todos) delete(index int) error {
	t := *todos

	if err := t.validateIndex(index); err != nil {
		return err
	}

	*todos = append(t[:index], t[index+1:]...)

	return nil
}

func (todos *Todos) toggle(index int) error {
	t := *todos

	if err := t.validateIndex(index); err != nil {
		return err
	}

	isCompleted := t[index].Completed

	if !isCompleted {
		completionTime := time.Now()
		t[index].CompletedAt = &completionTime
	}

	t[index].Completed = !isCompleted

	return nil
}

func (todos *Todos) edit(index int, title string) error {
	t := *todos

	if err := t.validateIndex(index); err != nil {
		return err
	}

	t[index].Title = title

	return nil
}

func (todos *Todos) print() {
	table := table.New(os.Stdout)
	table.SetRowLines(false)
	table.SetHeaders("#", "Title", "Completed", "Created At", "Completed At")
	for index, t := range *todos {
		completed := "❌"
		completedAt := ""

		if t.Completed {
			completed = "✅"
			if t.CompletedAt != nil {
				completedAt = t.CompletedAt.Format(time.RFC1123)
			}
		}

		table.AddRow(strconv.Itoa(index), t.Title, completed, t.CreatedAt.Format(time.RFC1123), completedAt)
	}

	table.Render()
}

```

Lets’ try it out.

```go
package main

func main() {
    todos := Todos{}
    todos.add("Buy Milk")
    todos.add("Buy Bread")
    todos.toggle(0)
    todos.print()
}
```

We start by adding a couple of tasks: ''Buy Milk'' and ''Buy Bread''. Next, we toggle the completion status of the first item to mark it as complete. Then, we use the `print` method to display our tasks in a structured table.

It would be nice to have functionality to save our to-do list to a file and read it back from there, keeping our data persistent between sessions. Let’s implement that next.

Create a file called `storage.go`

```go
import (
    "encoding/json"
    "os"
)

type Storage[T any] struct {
    FileName string
}

func NewStorage[T any](fileName string) *Storage[T] {
    return &Storage[T]{FileName: fileName}
}

func (s *Storage[T]) Save(data T) error {
    fileData, err := json.MarshalIndent(data, "", "")
   
    if err != nil {
        return err
    }
   
    return os.WriteFile(s.FileName, fileData, 0644)
}

func (s *Storage[T]) Load(data *T) error {
    fileData, err := os.ReadFile(s.FileName)
   
    if err != nil {
        return err
    }

    return json.Unmarshal(fileData, data)
}
```

This code defines a `Storage` structure to manage file operations generically, which means it can handle any type, such as our to-do list or other data types in the future.

In the `NewStorage` We initiate a `Storage` instance with a specified file name.

The save function takes any data of type `T` and saves it into a file in JSON format. It neatly formats the JSON for better readability and sets appropriate file permissions.

The load function retrieves data from the specified file and converts the JSON back into our data structure of type `T`.

Lets try it out

```go
package main

func main() {
    todos := Todos{}
    storage := NewStorage[Todos]("todos.json")
    storage.Load(&todos)
    todos.add("Buy Milk")
    todos.add("Buy Bread")
    todos.toggle(0)
    todos.print()
    storage.Save(todos)
}
```

We start by creating a new storage with the Todos type & the file name `todos.json`. This file doesn’t exist, so the `Load` function won’t find any data to load. We then add some todos to our list and save them. This process creates the `todos.json` file with our new data. If we run the program again, it will load the todos from this file back into the program.

The last part that is missing is to be able to run the program with different commands. Create a new file called `command.go`

```go
package main

import (
    "flag"
    "fmt"
    "os"
    "strconv"
    "strings"
)

type CmdFlags struct {
    Add    string
    Del    int
    Edit   string
    Toggle int
    List   bool
}

func NewCmdFlags() *CmdFlags {
    cf := CmdFlags{}
   
    flag.StringVar(&cf.Add, "add", "", "Add a new todo specify title")
    flag.StringVar(&cf.Edit, "edit", "", "Edit a todo by index & specify a new title. id:new_title")
    flag.IntVar(&cf.Del, "del", -1, "Specify todo by index to delete")
    flag.IntVar(&cf.Toggle, "toggle", -1, "Specify todo by index to toggle complete true/false")
    flag.BoolVar(&cf.List, "list", false, "List all todos")
   
    flag.Parse()
   
    return &cf
}

```

This block of code sets up the structure with all available commands and initializes the command-line flags. Each flag is defined with a specific type, a pointer to the data, a default value, and a description. We then parse these flags to populate the `CmdFlags` structure.

Next, we implement an `Execute` function that evaluates the values in `CmdFlags` and invokes the corresponding method from the `Todos` structure

```go

func (cf *CmdFlags) Execute(todos *Todos) {
    switch {
    case cf.List:
        todos.print()
    case cf.Add != "":
        todos.add(cf.Add)
    case cf.Edit != "":
        parts := strings.SplitN(cf.Edit, ":", 2)
        if len(parts) != 2 {
            fmt.Println("Error: Invalid format for edit. Please use index:new_title")
            os.Exit(1)
        }
        index, err := strconv.Atoi(parts[0])
        if err != nil {
            fmt.Println("Error: Invalid index for edit.")
            os.Exit(1)

        }
        todos.edit(index, parts[1])
    case cf.Toggle != -1:
        todos.toggle(cf.Toggle)

    case cf.Del != -1:
        todos.delete(cf.Del)

    default:
        fmt.Println("Invalid command")
    }
}
```

This function checks each flag in the `CmdFlags` to see which action should be performed,

Here is the full code for the `command.go`

```go
package main

import (
	"flag"
	"fmt"
	"os"
	"strconv"
	"strings"
)

type CmdFlags struct {
	Add    string
	Del    int
	Edit   string
	Toggle int
	List   bool
}

func NewCmdFlags() *CmdFlags {
	cf := CmdFlags{}

	flag.StringVar(&cf.Add, "add", "", "Add a new todo specify title")
	flag.StringVar(&cf.Edit, "edit", "", "Edit a todo by index & specify a new title. id:new_title")
	flag.IntVar(&cf.Del, "del", -1, "Specify a todo by index to delete")
	flag.IntVar(&cf.Toggle, "toggle", -1, "Specify a todo by index to toggle")
	flag.BoolVar(&cf.List, "list", false, "List all todos")

	flag.Parse()

	return &cf
}

func (cf *CmdFlags) Execute(todos *Todos) {
	switch {
	case cf.List:
		todos.print()
	case cf.Add != "":
		todos.add(cf.Add)
	case cf.Edit != "":
		parts := strings.SplitN(cf.Edit, ":", 2)
		if len(parts) != 2 {
			fmt.Println("Error, invalid format for edit. Please use id:new_title")
			os.Exit(1)
		}

		index, err := strconv.Atoi(parts[0])

		if err != nil {
			fmt.Println("Error: invalid index for edit")
			os.Exit(1)
		}

		todos.edit(index, parts[1])

	case cf.Toggle != -1:
		todos.toggle(cf.Toggle)

	case cf.Del != -1:
		todos.delete(cf.Del)

	default:
		fmt.Println("Invalid command")
	}
}
```

Finally, we update the `main.go` file to integrate these changes

```go
package main

func main() {
todos := Todos{}

storage := NewStorage[Todos]("todos.json")
storage.Load(&todos)

cmdFlags := NewCmdFlags()
cmdFlags.Execute(&todos)

storage.Save(todos)
}
```

In the main function, we initialize the `Todos` and `Storage`, load any existing todos from a file, process commands based on user input, and then save any changes back to the file.

Full source code can be found here [Github](https://github.com/patni1992/CLI-Todo-App-In-Go)

## Conclusion

We''ve reached the end of our tutorial on how to build a CLI to-do application using Go. Feel free to expand on what we''ve covered by adding new features or enhancing existing ones to make the app even more robust. Thank you for joining me today. See you in the next video!
', NULL, NULL, '0', 'Ready to get started?', 'Get instant access to all content and downloads', 'Buy Now', '1', '1', '0', '0', '0', '1760278860000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '1760379699581', '1763815432959'),
('cmgpi6sz40000y4zntbgt8rd2', 'is-go-worth-learning-in-2025', 'Is Go Worth Learning in 2025?', ' Is worth learning Go in 2025? Let''s explore what the job market, the tech landscape, and the language itself have to say.', '0', 'NONE', NULL, '/images/go-worth-learning-2025.png', NULL, NULL, NULL, 'The tech world in 2025 is moving faster than ever, with cloud computing, microservices, and scalable infrastructure leading the way.  
Go (Golang) was built for exactly this environment, simple, fast, and designed to tackle real-world engineering challenges at scale.

If you''re wondering whether it''s still a good idea to learn, the short answer is yes and in this article, we''ll break down why.

## The Job Market Speaks: Go Developers Are in Demand

If you''re looking for a language that opens doors, Go is a great pick.

- **High Salaries:** According to [Glassdoor](https://www.glassdoor.com/Salaries/go-developer-salary-SRCH_KO0%2C12.htm) and [Golang Cafe](https://golang.cafe/Golang-Developer-Salary-USA), Go developers in the U.S. earn an average salary of around **$132,651/year**, with entry-level roles starting around **$116,000** and senior engineers easily making **$170,000+**.

- **Global Demand:** Go isn''t just popular in the U.S. — it''s gaining traction in Europe, India, Australia, and across Southeast Asia.

- **Top Companies Use It:** Companies like Google, Uber, Dropbox, and Cloudflare rely on Go for building fast, scalable backend systems.

In short: learning Go can open up some seriously good opportunities.

## Go Is Built for What Comes Next

Go was designed to solve modern challenges — and it still shines today.

- **Concurrency Built-In:** Go''s [goroutines](https://go.dev/doc/effective_go#goroutines) and [channels](https://go.dev/doc/effective_go#channels) make it easier to write code that handles many tasks at once, without a headache.

- **Cloud-Native Friendly:** Lightweight and fast, Go apps fit perfectly into containerized environments like [Docker](https://www.docker.com/) and [Kubernetes](https://kubernetes.io/).

- **A Sweet Spot:** While Python can be slow and Rust can feel complicated, Go hits a balance between speed, simplicity, and reliability.

## Beginner Friendly

One of the best things about Go? It''s easy to get started and satisfying to stick with.

- **Simple, Readable Syntax:** Go keeps things clean and straightforward. You don''t need to memorize mountains of rules to write solid code.

- **Helpful Standard Library:** Need to build a web server or work with files? Go''s built-in tools make it easy, no need for huge third-party frameworks.

- **Automatic Garbage Collection:** Go handles memory management behind the scenes, so you can focus more on building features and less on debugging memory leaks.

## Ecosystem Momentum: It''s More Than Just a Language

A language is only as strong as its ecosystem and Go''s is thriving.

- **Huge Open-Source Community:** Check out projects on [Awesome Go](https://github.com/avelino/awesome-go) — you''ll find everything from web frameworks, CLI tools, machine learning, and more.

- **Powering the Cloud:** Tools like [Docker](https://www.docker.com/), [Kubernetes](https://kubernetes.io/), and [Terraform](https://www.terraform.io/) are all built in Go.

- **Stable and Evolving:** Go is actively maintained with regular releases, keeping it modern without losing its simple, stable foundation. Latest release notes of Go can be found [here](https://go.dev/doc/devel/release).

## Where Go Really Shines

Go''s sweet spot is building real-world, scalable systems. Here''s where it truly excels:

### 🛠 Backend APIs & Microservices

Go''s simplicity and performance make it a top choice for building clean, modular APIs. Its concurrency model makes it easy to scale microservices without drowning in complexity.

### ☁️ Cloud-Native App

Go was practically designed for the cloud. With fast startup times, tiny memory footprints. Go applications are lightweight and highly portable. It''s the language of choice for developers building on AWS, GCP, or Azure.

### ⚙️ DevOps & Infrastructure Tools

Look under the hood of tools like Docker, Kubernetes, and Terraform and you''ll find Go. It''s become the de facto language for DevOps tooling, thanks to its speed, concurrency support, and ease of cross-compilation.

### 🚀 High-Traffic Scalable Systems

When your app needs to handle millions of requests per second, Go can build web services and distributed systems that are both blazing fast and resource efficient.

## The Learning Curve: Surprisingly Smooth

Learning Go feels refreshingly straightforward.

- **Designed to Be Easy:** The [A Tour of Go](https://tour.golang.org/) tutorial walks you through the basics interactively.
- **Amazing Docs:** The official [Go documentation](https://go.dev/doc/) is one of the most readable and helpful you''ll find.
- **Community Help:** Places like [r/golang](https://www.reddit.com/r/golang/), [Stack Overflow](https://stackoverflow.com/questions/tagged/go) are full of friendly developers happy to help.

## Challenges and Misconceptions

No language is perfect, and Go has its limitations:

- **Not Great for GUI Apps:** While possible, building desktop apps is smoother with other tools.
- **Not Focused on Data Science:** Python still dominates in ML and data-heavy work.
- **Common Myth - "Go is only for Google-scale problems":** Totally not true! Go fits perfectly for solo projects, startups, and mid-sized apps too.

## Final Verdict: Should You Learn Go in 2025?

✅ **Yes!**

If you want a language that''s simple to learn, powerful to use, and highly in demand, Go is a smart bet for 2025 and beyond.

It''s especially great for:

- Backend developers
- Cloud engineers
- DevOps professionals
- Career changers looking for a high-paying, future-proof skill

**Learn it, build with it, and watch your career grow.**

## Bonus: Want More Go Goodness?

If you''re serious about leveling up your Go skills, we''ve got a little bonus for you!

👉 [**Join our Go community**](/join-community/) and get **a free PDF with 10 Go Tips & Tricks**
', NULL, NULL, '1', 'Ready to get started?', 'Get instant access to all content and downloads', 'Buy Now', '1', '1', '0', '0', '0', '1745737380000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '1760382332465', '1763815470089'),
('cmgq55m2g0000y44qbo5uzusb', 'pocketbase-backend-made-simple', 'PocketBase: Backend Made Simple', 'PocketBase: Backend Made Simple. Lightweight, open-source and built in Go (golang). This backend solution is perfect for developers and small teams. Learn how to streamline your backend development with built-in features like database management, authentication, and real-time updates.', '0', 'NONE', 'y0iKfEyCs_Y?si=O1tINGk-_9ReC3XQ', '/images/pocketbase-made-simple.png', NULL, NULL, NULL, 'If you''re a solo developer or part of a small team, let me introduce you to one of the best-kept secrets in backend development: [**PocketBase**](https://pocketbase.io/).

PocketBase is an open-source backend server built in Go (Golang). It rolls **database**, **authentication**, **real-time updates** (through WebSocket connections), and **file storage** into a single, tiny executable file.

But don''t let the small size fool you. PocketBase can also flex like a full framework thanks to built-in support for extending it with **JavaScript** or **Go**.

## Table of contents

## Why I Love PocketBase

One of my favorite things about PocketBase is how many built-in features it ships with. For every new app I build, I don''t have to reinvent the wheel.

## Built-in Dashboard

PocketBase comes with a slick **built-in dashboard**.  
Here''s what you can do inside it:

- **Manage your backend easily** without touching a line of backend code.
- **View all your tables** (or _collections_, as PocketBase calls them).
- **Create new collections** set up fields with specific types (text, number, boolean, date, etc.).
- **Edit & delete records** super intuitive and incredibly fast.
- **Set API rules**: control whether collections are publicly available or restricted to authenticated users.
- **Backup your database** to S3.
- **Run cron jobs** to automate tasks.
- **View server logs** to keep track of everything.

And much more.

![PocketBase Dashboard](/images/pocketbase-dashboard.png)

## Authentication Done Right

Out of the box, PocketBase supports **email and password authentication**. But it gets better: You can also add OAuth providers like **Google**, **Facebook**, **GitHub**, and more. Just plug in the provider''s token, and you''re ready to roll.

## REST API

Every collections comes with **CRUD REST API** endpoints.

- Full **CRUD** support for each collection.
- **Pagination**, **sorting**, **filtering**, **field selection** — all baked right into the API.
- Instant preview of what your responses will look like.
- Set API rules: Control authentication and permissions for each collection.

## Server Logs, cron jobs, email, backups and storage

All Built In.

### Settings

A **settings tab** where you can configure general server settings.

![PocketBase General Settings](/images/pocketbase-general-settings.png)

### Server Logs

A full **server log viewer** to keep track of everything.
![PocketBase Server Logs](/images/pocketbase-server-logs.png)

### Email

A **email settings** tab where you can configure SMTP settings, send test emails.

![PocketBase Email Settings](/images/pocketbase-mail-settings.png)

### File Storage

A **file storage settings** tab where you can setup your s3 bucket to store files.

![PocketBase File Storage Settings](/images/pocketbase-file-storage.png)

### Backups

The **backup settings** tab allows you to configure database backups, create new ones, delete existing backups, restore from a backup, and more.

![PocketBase Backups settings page](/images/pocketbase-backups.png)

### Cron Jobs

**Cron jobs** tab where you can schedule cron jobs to automate tasks. Comes with Pocketbase default cron jobs, but you can also add your own if you extend PocketBase as a framework.

![PocketBase Cron Jobs settings page](/images/pocketbase-cronjobs.png)

### Import/Export Like a Pro

Export all your collections as **JSON** with a click, or import them just as easily.

![PocketBase Import/Export collections](/images/pocketbase-import-export.png)

## Final Thoughts

This was just a quick overview, but honestly, PocketBase is a game-changer for anyone looking to spin up powerful backends fast.  
Whether you''re building a SaaS app, a personal project, or anything in between, **PocketBase** should absolutely be on your radar. 🚀

## FAQ About PocketBase

### Is PocketBase suitable for mobile app backends?

Yes! PocketBase is lightweight and fast, making it a great choice for powering mobile app backends — especially for MVPs, internal tools, and indie apps.

### Can I host PocketBase on my own server?

Absolutely. You can self-host PocketBase on your own VPS, server, or even locally during development.

### Is PocketBase free to use?

Yes, PocketBase is completely open-source and free to use. You can even extend it and customize it to fit your specific project needs without licensing costs.

### How does PocketBase compare to Firebase?

PocketBase and Firebase both offer backend services, but they target different needs.

- **Database Type**:  
  Firebase uses a NoSQL database (Firestore), which is flexible but less structured.  
  PocketBase, on the other hand, uses an embedded **SQL database** (SQLite), giving you strong relational data support with clear structure and constraints.

- **Hosting**:  
  Firebase is a **managed service** hosted on **Google''s servers** — you don''t have to manage infrastructure, but you''re tied to Google''s platform and pricing.  
  PocketBase is a **self-hosted solution** — you run it on your own server, VPS, or cloud provider, giving you full control over data, backups, and server configurations.

- **Pricing**:  
  Firebase has a generous free tier, but costs can quickly rise as your app scales, especially with real-time database reads/writes and storage.  
  PocketBase itself is **free and open-source**, you only pay for whatever hosting you choose, often making it cheaper in the long run.

- **Flexibility**:  
  PocketBase allows you to **extend the backend** with custom Go code, adding APIs, events, and business logic exactly how you want.  
  With Firebase, you''re mostly limited to what Google offers, unless you add Cloud Functions (which have their own costs and limits).

- **Best for**:
  - Use **Firebase** if you want a fast launch with minimal server management and don''t mind vendor lock-in.
  - Use **PocketBase** if you want full control, relational data, and a backend you can completely customize without relying on a third party.

In short:  
**Firebase** is easy but centralized.  
**PocketBase** is lightweight, powerful, and yours to own.

### Can I integrate PocketBase with other services?

Yes. You can easily integrate PocketBase with third-party APIs, frontend frameworks, and cloud storage providers like AWS S3, thanks to its flexible API and extensibility with JavaScript or Go.

### How do I extend PocketBase with Go?

[To extend PocketBase with Go](https://pocketbase.io/docs/go-overview/).

1. Create a new folder with the name of your project and create a `main.go` file with the following content:

   ```go
   package main

   import (
       "log"
       "os"

       "github.com/pocketbase/pocketbase"
       "github.com/pocketbase/pocketbase/apis"
       "github.com/pocketbase/pocketbase/core"
   )

   func main() {
       app := pocketbase.New()

       app.OnServe().BindFunc(func(se *core.ServeEvent) error {
           // serves static files from the provided public dir (if exists)
           se.Router.GET("/{path...}", apis.Static(os.DirFS("./pb_public"), false))

           return se.Next()
       })

       if err := app.Start(); err != nil {
           log.Fatal(err)
       }
   }
   ```

2. init dependencies,

   ```bash
   go mod init myapp && go mod tidy
   ```

3. Start the PocketBase server:

   ```bash
   go run . serve
   ```

By doing this, you can fully customize how PocketBase behaves for your project.
', NULL, NULL, '1', 'Ready to get started?', 'Get instant access to all content and downloads', 'Buy Now', '1', '1', '0', '0', '0', '1745682480000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '1760420908024', '1763815506151'),
('cmgq5c8rw0001y44q6qbsth89', 'go-release-1-24-whats-new', 'What''s new in Go (Golang) 1.24', 'Discover the latest features and improvements in Go 1.24, including performance boosts, security enhancements, and developer experience upgrades.', '0', 'NONE', NULL, '/images/what-is-new-go-1-24.png', NULL, NULL, NULL, 'Released in **February 2025**, [Go 1.24](https://go.dev/blog/go1.24) is a steady, well-rounded update to the Go programming language. It brings a mix of improvements across the language, runtime, tooling, and standard library. Release notes are available [here](https://tip.golang.org/doc/go1.24).

The main themes of this release are **performance optimizations**, **security enhancements**, and **a better developer experience**.

Highlights include support for **generic type aliases**, **faster map operations** with Swiss Tables, and new tools to streamline benchmarking and code analysis. In this post, we''ll take a closer look at the most notable changes and what they mean for Go developers.

## Table of contents

## Language Enhancements

### Generic Type Aliases

Go 1.24 introduces support for **generic type aliases**, which allow you to reuse type parameters and constraints across different parts of your code. If you''ve written any generic code in Go, you''ve probably noticed that repeating constraints can get tedious. This feature helps clean that up.

#### 🧠 What is it?

A **type alias** in Go is a way to give an existing type another name. With Go 1.24, you can now add **type parameters** to these aliases—making them generic.

#### ✍️ Example

```go
// Define a generic constraint using a type alias
type Number[T int | float64] = T

// Reuse the alias in a function
func Sum[T Number[T]](a, b T) T {
    return a + b
}
```

This simplifies how you declare constraints and helps avoid duplication. It''s especially useful in libraries and codebases where you want to define behavior for a range of types.

#### ✅ Why it matters

- Encourages reusable, cleaner code
- Reduces repetition when using generic constraints
- Makes complex generic code easier to read and maintain

## Runtime and Performance Boosts

### Swiss Table-Based Maps

Go''s map implementation has been updated to use **Swiss Tables**, a more cache-efficient data structure inspired by what''s used in languages like C++ (in `absl::flat_hash_map`).

#### 🧠 What is it?

Swiss Tables improve how Go stores and looks up keys in maps. They reduce CPU cache misses, which makes lookups and inserts faster.Especially in tight loops or large datasets.

#### 📊 Performance Benefit

Benchmarks show about a **2–3% speedup** in workloads that make heavy use of maps.

#### ✍️ Example

You don''t have to change anything in your code:

```go
data := map[string]int{
    "apple":  1,
    "banana": 2,
    "cherry": 3,
}

value := data["banana"] // this lookup is now faster under the hood
```

It''s a silent upgrade, but one that can make a difference in performance-critical applications.

### Memory & Concurrency Tweaks

Go 1.24 also introduces two smaller—but still meaningful runtime improvements:

#### 🔧 More Efficient Memory Allocation

Allocating memory for small objects (e.g., structs or small slices) is now slightly faster, thanks to internal tweaks in the runtime allocator. This helps with apps that create many short-lived objects.

#### 🔄 Better Mutex Performance

The runtime now uses a new internal **mutex implementation**, improving the performance of programs with lots of goroutines contending for locks.

#### ✍️ Example

Imagine this kind of scenario:

```go
var mu sync.Mutex
counter := 0

for i := 0; i < 100; i++ {
    go func() {
        mu.Lock()
        counter++
        mu.Unlock()
    }()
}
```

The locking/unlocking here is a little more efficient under Go 1.24, particularly at scale.

## Toolchain Upgrades

### Tool Dependency Tracking

Go 1.24 adds a new way to manage development tools in your module using the `tool` directive. This makes it easier to keep track of tools your project depends on, like linters, generators, or custom scripts without bloating your `go.mod`.

#### 🧠 How it works

You can now add a tool dependency like this:

```bash
go get -tool golang.org/x/tools/cmd/godoc
```

This adds a `tool` directive to your `go.mod` file. Then, to run the tool:

```bash
go tool godoc -http=:6060
```

It''s clean, version-controlled, and keeps your tooling in sync across environments.

### Supercharged `go vet`

The `go vet` command is now smarter in Go 1.24. It includes new analyzers specifically designed to catch issues in tests, fuzzers, benchmarks, and examples.

#### ✅ What it catches

- Incorrect function signatures (e.g., forgetting `t *testing.T`)
- Naming mismatches (e.g., a `Benchmark` function that doesn''t follow naming conventions)
- Misused test helpers

#### ✍️ Example

```go
func TestMyFunc(t testing.T) { // Missing ''*''
    // go vet will now flag this
    // wrong signature for TestMyFunc, must be: func TestMyFunc(t *testing.T)
}
```

These checks help catch subtle bugs early, before they become flaky test failures.

### Smarter Benchmarking

Benchmarking in Go often required writing boilerplate loops. Go 1.24 introduces `testing.B.Loop`, a method that eliminates that boilerplate and makes benchmarks cleaner.

#### ✍️ Example

Before:

```go
func BenchmarkAdd(b *testing.B) {
    for i := 0; i < b.N; i++ {
        _ = 1 + 2
    }
}
```

After:

```go
func BenchmarkAdd(b *testing.B) {
    b.Loop(func() {
        _ = 1 + 2
    })
}
```

It''s a small change that improves readability and consistency in benchmarking code.

## Security and Filesystem Improvements

### FIPS 140-3 Compliant Crypto

Go 1.24 adds support for cryptographic algorithms that comply with **FIPS 140-3**, the latest U.S. government standard for secure cryptographic modules.

#### 🔒 Why it matters

- Important for compliance in regulated industries (e.g., government, finance, healthcare)
- Makes it easier to use Go in environments where certified crypto is a must
- You don''t need to change your code, just build Go with the right configuration

This change makes Go a better fit for security-critical systems.

### Safe File Access with `os.Root`

A new type called `os.Root` has been introduced, which allows you to **scope file access** to a specific directory tree. It''s like giving your app a sandboxed view of the filesystem.

#### ✍️ Example

```go
root, err := os.OpenRoot("/safe-directory")
if err != nil {
    log.Fatal(err)
}

file, err := root.Open("data.txt")
if err != nil {
    log.Fatal(err)
}
defer file.Close()
```

This ensures your program can only read files under `/safe-directory`, and not wander elsewhere.

#### 🛡️ Practical Use Cases

- CLI tools that process user input
- Web apps that let users upload/download files
- Sandbox environments with restricted access

It adds a safety net to prevent accidental or malicious file access outside your intended scope.

## WebAssembly & WASI Support

### `go:wasmexport` Directive

Go 1.24 adds a new `//go:wasmexport` directive that allows you to explicitly export Go functions for use in WebAssembly (WASM) environments.

#### 🚀 What it enables

This feature makes it easier to build Go modules that interact directly with JavaScript (in browsers) or host environments like WASI.

#### ✍️ Example

```go
//go:wasmexport add
func add(a, b int) int {
    return a + b
}
```

This tells the compiler to expose the `add` function to the host, allowing JavaScript or other WASM consumers to call it directly.

#### ✅ Why it matters

- Clearer interop between Go and WASM
- Better control over what functions are visible to the outside world
- More useful in frontend or edge-computing/serverless scenarios

### WASI Reactor & Library Support

Go 1.24 introduces initial support for **WASI reactors** and modular **library-style components** in WebAssembly builds.

#### 🧩 What it adds

- Support for long-running WASM services (reactors)
- Ability to build and reuse Go packages as WASM libraries

#### 🛠️ Why it matters

- Enables better modularity in WASM projects
- Opens the door to more scalable and maintainable WebAssembly applications
- Makes Go more competitive in the growing serverless/edge ecosystem

## Standard Library Upgrades

Here are some of the notable changes to the standard library in Go 1.24.

### New String & Byte Iterators

Go 1.24 brings new helper functions like `strings.Lines()` and `strings.SplitSeq()` that make it easier to process text and binary data.

#### ✍️ Examples

```go
iter := strings.Lines("first\nsecond\nthird")
for iter.Next() {
    fmt.Println(iter.Value())
}

iter2 := strings.SplitSeq("a--b--c", "--")
for iter2.Next() {
    fmt.Println(iter2.Value())
}
```

These functions let you iterate directly over data without creating intermediate slices, making your code faster and more memory-efficient.

#### 🚀 Why it matters

- Reduces boilerplate in text-processing tasks
- More readable and performant alternatives to `strings.Split()` and related functions

### Other API Goodies

Go 1.24 adds several smaller—but useful—improvements across the standard library:

#### 🧠 Weak Pointers & Finalizers

The `runtime` package now includes support for **weak pointers**, which allow the garbage collector to track an object without preventing its collection.

- Useful for caches or observability tools where objects shouldn''t stay alive just because they''re referenced.

#### 🔐 SHA-3 and Other Crypto Enhancements

The `crypto` package now includes **SHA-3** support and other low-level updates to help keep Go''s cryptography suite modern and secure.

#### 🧾 JSON Struct Tag Upgrades

Go 1.24 introduces the new `omitzero` option for JSON struct tags. It works similarly to `omitempty`, but with a more precise rule: it **only omits the field if its value is the type''s zero value**.

This helps avoid unexpected behavior where `omitempty` might omit a field that''s not technically "empty" but still evaluates as false.

```go
type Item struct {
    Name  string `json:"name,omitempty"`     // Omits if empty string
    Count int    `json:"count,omitzero"`     // Omits only if Count == 0
}
```

Use `omitzero` when you want **tighter control** and want to ensure a field is **only left out if it''s exactly the zero value for its type** not just empty or falsey.

This gives you finer control over how data is serialized.

## Community Takes & Real-World Impact

As with most Go releases, Go 1.24 sparked a wave of community discussion across blogs, forums, and YouTube.

#### 💬 Highlights from the Community

- [Reddit discussions](https://www.reddit.com/r/golang/comments/1hfmvlz/golang_124_is_looking_seriously_awesome/) Mostly focused on general impressions of the release.
- [Mario Carrion''s YouTube walkthrough](https://www.youtube.com/watch?v=qjiIA0220ms) Provides a clear, practical overview of Go 1.24 features.
- [Moksh](https://dev.to/mx_tech/-golang-124-breaking-down-the-latest-features-and-enhancements-1-1l5p) Shares benchmarks & comparisons.
- [Anton Zhiyanov''s interactive breakdown](https://antonz.org/go-1-24/) Walks through Go 1.24''s key features with runnable examples.

## Closing Thoughts

Go 1.24 may not introduce sweeping changes, but it delivers **meaningful improvements** in areas that matter. Performance, security, and developer tooling.

It''s a solid update. Not a revolutionary release, but definitely one that improves the day-to-day experience for Go developers.

It''s a release that focuses on **polish over flash**, smoothing out rough edges in everyday workflows and paving the way for deeper improvements in future versions.

As Go continues to evolve, it''s clear that the team is balancing innovation with stability, making it easier to build fast, reliable software with confidence.
', NULL, NULL, '1', 'Ready to get started?', 'Get instant access to all content and downloads', 'Buy Now', '1', '1', '0', '0', '0', '1777168560000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '1760421217388', '1763815617519'),
('cmgq5iqpz0002y44q6iu3pejm', 'deploy-a-go-app-to-aws-ec2-with-nginx-ssl-custom-domain-step-by-step', ' Deploy a Go app to AWS (EC2) with Nginx, SSL & Custom Domain (Step-by-Step)', 'Deploy a complete Go (Golang) app to AWS EC2 with Nginx, SSL, and a custom domain! This tutorial walks you through launching an EC2 instance on AWS, setting up your Go app, configuring Nginx as a reverse proxy, securing your connection to the server with SSL, and connecting a custom domain.', '0', 'NONE', 'QzwAsLNIl10?si=pdgVbjDjmL3Eymo5', '/images/deploy-rest-api-go-aws.png', NULL, NULL, 'In this tutorial, we will deploy a Go backend to an AWS EC2 instance. We will use Nginx as a reverse proxy to serve the API and SSL to secure the connection and add a custom domain.

This is a follow-up to a previous tutorial where we built a complete REST API in Go using Gin. You can find the full tutorial at [Complete REST API in Go – Build an Event App](https://www.youtube.com/watch?v=ERZadn9artM).

## Table of contents

## Prerequisites

Before we begin, make sure you have:

1. [AWS Account](https://aws.amazon.com/free)

## Setting up EC2

### Step 1: Launch an EC2 Instance

1. **Access AWS Console:**

   - Open the AWS Console and use the search bar to navigate to EC2. ![Search EC2](/images/search-ec2.png)

2. **Launch Instance:**

   - Click on "Launch Instance." ![Launch EC2 Instance](/images/launch-instance.png)

3. **Configure Instance:**

   - **Name:** `go-api`
   - **AMI:** Amazon Linux 2023
   - **Instance Type:** t3.micro (free tier) ![Configure EC2](/images/configure-ec2.png)

4. **Key Pair:**

   - Create a new key pair named `go-api-key` and assign it to the instance. ![Key Pair for EC2](/images/keypair.png)

5. **Network Settings:**

   - Create a security group with the following inbound rules:
     - **SSH:** TCP, Port 22, Source: Anywhere (0.0.0.0/0)
     - **HTTP:** TCP, Port 80, Source: Anywhere (0.0.0.0/0)
     - **HTTPS:** TCP, Port 443, Source: Anywhere (0.0.0.0/0) ![EC2 Network Settings](/images/ec2-network-settings.png)

6. **Storage and Advanced Details:**

   - **Storage:** 8 GB (default)
   - **Advanced Details:** Default settings

7. **Launch the Instance:**
   - Click "Launch instance." ![Launch EC2 Instance](/images/click-launch-instance.png)

### Step 2: Connect to the EC2 Instance

1. **Set Key Pair Permissions:**

   - After downloading the key pair, open a terminal and set permissions:
     ```bash
     chmod 400 go-api-key.pem
     ```
   - This ensures only the owner can read the file, preventing connection errors.

2. **Connect to the Instance:**
   - Find the instance''s IP address in the EC2 instance details. ![EC2 Instance Details](/images/ec2-instance-details.png)
   - Use the terminal to connect using the key pair:
     ```bash
     ssh -i go-api-key.pem ec2-user@your-instance-ip
     ```
   - `ec2-user` is the default username for Amazon Linux 2023.

## Building the Application on EC2

1. **Inside EC2 instance install Git and Go**:

   ```bash
   sudo dnf install git golang -y
   ```

2. **Clone the Repository**:

   ```bash
   git clone https://github.com/patni1992/Rest-api-in-go-gin.git
   ```

3. **Navigate to the Repository**:

   ```bash
   cd Rest-api-in-go-gin
   ```

4. **Run Migrations**:

   - Run migrations to create the database:

   ```bash
   go run ./cmd/migrate/ up

   ```

5. **Build the Application api binary**:

   - Build the application using `go build`:
     ```bash
     go build -o events-api ./cmd/api
     ```

## Deploying the Application

1. **Make the API binary executable**:

   ```bash
   chmod +x events-api
   ```

2. **Run the Application**:

- We will run the application in the background using nohup passing the environment variables and redirecting the output to a log file:

  ```bash
  GIN_MODE=release PORT=8080 JWT_SECRET=some-secure-value-12345 BASE_URL=https://go-api.yourdomain.com nohup ./events-api > events-api.log 2>&1 &
  ```

Verify the application is running:

```sh
curl -v localhost:8080/api/v1/events
```

If everything is working, you should see a status code 200.

Currently we can only access the API from the EC2 instance and not from the outside world, we will add a custom domain and setup Nginx to serve the API.

## Stopping the Application

(This is how you can stop the application if you need to, keep it running for now)

To stop the application, you can use the `kill` command to terminate the process. First, find the process ID (PID) of the running application:

```bash
ps aux | grep events-api
```

This will list the processes related to `events-api`. Look for the line that corresponds to your running application and note the PID (the number in the second column).

Then, use the `kill` command to stop the application:

```bash
kill <PID>
```

Replace `<PID>` with the actual process ID you found. This will terminate the application running in the background.

## Adding a Subdomain

1. **Create a Subdomain**:

   - In your domain registrar''s DNS settings, add a new A record for your subdomain (e.g., `go-api.yourdomain.com`) pointing to your EC2 instance''s public IP. This is how it looks in Cloudflare:

   ![Cloudflare DNS Settings](/images/cloudflare-dns.png)

2. **Verify Propagation**:

   - Use tools like [whatsmydns.net](https://www.whatsmydns.net/) to ensure the subdomain points to the correct IP.

   ![Whatsmydns.net](/images/whatsmydns.png)

## Configuring Nginx for SSL

### 1. Install Nginx

```bash
sudo dnf install nginx -y
```

### 2. Configure Nginx

1. **Edit Nginx Configuration**:

   - Open the Nginx configuration file with nano or vim if you prefer:

     ```bash
     sudo nano /etc/nginx/nginx.conf
     ```

2. **Add Required Blocks**:

   - Ensure your configuration includes the `events` block and the `http` block:

     ```nginx
     events {
         worker_connections 1024;
     }

     http {
         server {
             listen 80;
             server_name go-api.yourdomain.com;

             location / {
                 proxy_pass http://localhost:8080;
                 proxy_set_header Host $host;
                 proxy_set_header X-Real-IP $remote_addr;
                 proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                 proxy_set_header X-Forwarded-Proto $scheme;
             }
         }
     }
     ```

3. **Test Nginx Configuration**:

   ```bash
   sudo nginx -t
   ```

4. **Restart Nginx**:
   ```bash
   sudo systemctl restart nginx
   ```

### 3. Obtain SSL Certificate

1. **Install Certbot**:

   ```bash
   sudo dnf install certbot python3-certbot-nginx -y
   ```

2. **Obtain and Install SSL Certificate**:

   ```bash
   sudo certbot --nginx -d go-api.yourdomain.com
   ```

3. **Automate Renewal**:
   - Certbot usually sets up automatic renewal, but you can verify with:
     ```bash
     sudo certbot renew --dry-run
     ```

### 4. Verify

- Access your application at `https://go-api.yourdomain.com`.

## Conclusion

You''ve successfully deployed your Go application to AWS EC2, with a custom domain and configured Nginx for SSL. Once you know how to do this, you can deploy your application to any other cloud provider the steps will be very similar and you can learn more about other services on AWS since many of them are built on top of AWS EC2.
', 'In this tutorial, we will deploy a Go backend to an AWS EC2 instance. We will use Nginx as a reverse proxy to serve the API and SSL to secure the connection and add a custom domain.

This is a follow-up to a previous tutorial where we built a complete REST API in Go using Gin. You can find the full tutorial at [Complete REST API in Go – Build an Event App](https://www.youtube.com/watch?v=ERZadn9artM).

## Table of contents

## Prerequisites

Before we begin, make sure you have:

1. [AWS Account](https://aws.amazon.com/free)

## Setting up EC2

### Step 1: Launch an EC2 Instance

1. **Access AWS Console:**

   - Open the AWS Console and use the search bar to navigate to EC2. ![Search EC2](/images/search-ec2.png)

2. **Launch Instance:**

   - Click on "Launch Instance." ![Launch EC2 Instance](/images/launch-instance.png)

3. **Configure Instance:**

   - **Name:** `go-api`
   - **AMI:** Amazon Linux 2023
   - **Instance Type:** t3.micro (free tier) ![Configure EC2](/images/configure-ec2.png)

4. **Key Pair:**

   - Create a new key pair named `go-api-key` and assign it to the instance. ![Key Pair for EC2](/images/keypair.png)

5. **Network Settings:**

   - Create a security group with the following inbound rules:
     - **SSH:** TCP, Port 22, Source: Anywhere (0.0.0.0/0)
     - **HTTP:** TCP, Port 80, Source: Anywhere (0.0.0.0/0)
     - **HTTPS:** TCP, Port 443, Source: Anywhere (0.0.0.0/0) ![EC2 Network Settings](/images/ec2-network-settings.png)

6. **Storage and Advanced Details:**

   - **Storage:** 8 GB (default)
   - **Advanced Details:** Default settings

7. **Launch the Instance:**
   - Click "Launch instance." ![Launch EC2 Instance](/images/click-launch-instance.png)

### Step 2: Connect to the EC2 Instance

1. **Set Key Pair Permissions:**

   - After downloading the key pair, open a terminal and set permissions:
     ```bash
     chmod 400 go-api-key.pem
     ```
   - This ensures only the owner can read the file, preventing connection errors.

2. **Connect to the Instance:**
   - Find the instance''s IP address in the EC2 instance details. ![EC2 Instance Details](/images/ec2-instance-details.png)
   - Use the terminal to connect using the key pair:
     ```bash
     ssh -i go-api-key.pem ec2-user@your-instance-ip
     ```
   - `ec2-user` is the default username for Amazon Linux 2023.

## Building the Application on EC2

1. **Inside EC2 instance install Git and Go**:

   ```bash
   sudo dnf install git golang -y
   ```

2. **Clone the Repository**:

   ```bash
   git clone https://github.com/patni1992/Rest-api-in-go-gin.git
   ```

3. **Navigate to the Repository**:

   ```bash
   cd Rest-api-in-go-gin
   ```

4. **Run Migrations**:

   - Run migrations to create the database:

   ```bash
   go run ./cmd/migrate/ up

   ```

5. **Build the Application api binary**:

   - Build the application using `go build`:
     ```bash
     go build -o events-api ./cmd/api
     ```

## Deploying the Application

1. **Make the API binary executable**:

   ```bash
   chmod +x events-api
   ```

2. **Run the Application**:

- We will run the application in the background using nohup passing the environment variables and redirecting the output to a log file:

  ```bash
  GIN_MODE=release PORT=8080 JWT_SECRET=some-secure-value-12345 BASE_URL=https://go-api.yourdomain.com nohup ./events-api > events-api.log 2>&1 &
  ```

Verify the application is running:

```sh
curl -v localhost:8080/api/v1/events
```

If everything is working, you should see a status code 200.

Currently we can only access the API from the EC2 instance and not from the outside world, we will add a custom domain and setup Nginx to serve the API.

## Stopping the Application

(This is how you can stop the application if you need to, keep it running for now)

To stop the application, you can use the `kill` command to terminate the process. First, find the process ID (PID) of the running application:

```bash
ps aux | grep events-api
```

This will list the processes related to `events-api`. Look for the line that corresponds to your running application and note the PID (the number in the second column).

Then, use the `kill` command to stop the application:

```bash
kill <PID>
```

Replace `<PID>` with the actual process ID you found. This will terminate the application running in the background.

## Adding a Subdomain

1. **Create a Subdomain**:

   - In your domain registrar''s DNS settings, add a new A record for your subdomain (e.g., `go-api.yourdomain.com`) pointing to your EC2 instance''s public IP. This is how it looks in Cloudflare:

   ![Cloudflare DNS Settings](/images/cloudflare-dns.png)

2. **Verify Propagation**:

   - Use tools like [whatsmydns.net](https://www.whatsmydns.net/) to ensure the subdomain points to the correct IP.

   ![Whatsmydns.net](/images/whatsmydns.png)

## Configuring Nginx for SSL

### 1. Install Nginx

```bash
sudo dnf install nginx -y
```

### 2. Configure Nginx

1. **Edit Nginx Configuration**:

   - Open the Nginx configuration file with nano or vim if you prefer:

     ```bash
     sudo nano /etc/nginx/nginx.conf
     ```

2. **Add Required Blocks**:

   - Ensure your configuration includes the `events` block and the `http` block:

     ```nginx
     events {
         worker_connections 1024;
     }

     http {
         server {
             listen 80;
             server_name go-api.yourdomain.com;

             location / {
                 proxy_pass http://localhost:8080;
                 proxy_set_header Host $host;
                 proxy_set_header X-Real-IP $remote_addr;
                 proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                 proxy_set_header X-Forwarded-Proto $scheme;
             }
         }
     }
     ```

3. **Test Nginx Configuration**:

   ```bash
   sudo nginx -t
   ```

4. **Restart Nginx**:
   ```bash
   sudo systemctl restart nginx
   ```

### 3. Obtain SSL Certificate

1. **Install Certbot**:

   ```bash
   sudo dnf install certbot python3-certbot-nginx -y
   ```

2. **Obtain and Install SSL Certificate**:

   ```bash
   sudo certbot --nginx -d go-api.yourdomain.com
   ```

3. **Automate Renewal**:
   - Certbot usually sets up automatic renewal, but you can verify with:
     ```bash
     sudo certbot renew --dry-run
     ```

### 4. Verify

- Access your application at `https://go-api.yourdomain.com`.

## Conclusion

You''ve successfully deployed your Go application to AWS EC2, with a custom domain and configured Nginx for SSL. Once you know how to do this, you can deploy your application to any other cloud provider the steps will be very similar and you can learn more about other services on AWS since many of them are built on top of AWS EC2.
', NULL, NULL, '1', 'Ready to get started?', 'Get instant access to all content and downloads', 'Buy Now', '1', '1', '0', '0', '0', '1745225880000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '1760421520583', '1763816865825'),
('cmgq7t69a0000y4hadpo4g83i', 'go-golang-sql', 'How to Use SQL in Go', 'In this tutorial, you''ll learn how to use SQL in Go (Golang).', '0', 'NONE', '8IlCOHLZlpM?si=i0llk5JTrTZHWSji', '/images/sql-in-go-thumb.png', NULL, NULL, 'Learn how to use SQL in Go (Golang) using SQLite! This tutorial covers connecting to a database, writing queries, creating tables, CRUD operations, and handling context and timeouts. You will be using exec, query, and queryrow, scan methods.

## Setting up the project

Start by opening a terminal.

1. Initialize a new project:

```bash
go mod init sql-in-go
```

2. Install the dependencies:

Install sqllite:

```bash
go get -u github.com/mattn/go-sqlite3
```

## Connecting to the database

To connect to the database create a new file called `main.go` and add the following code:

```go
package main

import (
   	"database/sql"
	"log"

	_ "github.com/mattn/go-sqlite3"
)

func main() {
    db, err := sql.Open("sqlite3", "./shop.db")
    if err != nil {
        log.Fatal(err)
    }
    defer db.Close()
}
```

We use the `sql.Open` function to open a connection to the database. The first argument is the driver name and the second argument is the database file path or the database connection string depending on the database.

We check if there is an error in opening the database connection. If there is an error, we log the error and exit the program.

The `defer db.Close()` ensures the database connection is closed when we are done.

## Common database operations

Here is a list of the queries we will use:

| Operation            | Description                                     | Example                                                                                     |
| -------------------- | ----------------------------------------------- | ------------------------------------------------------------------------------------------- |
| Create               | Create a new table if it does not exist         | `CREATE TABLE IF NOT EXISTS orders (id INTEGER PRIMARY KEY, product TEXT, amount INTEGER);` |
| Insert               | Insert new data into a table                    | `INSERT INTO orders (product, amount) VALUES (''Laptop'', 1000);`                             |
| Query all            | Retrieve all data from a table                  | `SELECT * FROM orders;`                                                                     |
| Query with condition | Retrieve rows matching a condition from a table | `SELECT * FROM orders WHERE id = 1;`                                                        |
| Update               | Modify existing data in a table                 | `UPDATE orders SET amount = 1500 WHERE id = 1;`                                             |
| Delete               | Remove data from a table                        | `DELETE FROM orders WHERE id = 1;`                                                          |

## Working with Orders & Database

### Creating the OrderRepository struct

Create new folder called `database` and inside create a file called `orders.go`.

```go
package database

import "database/sql"

type OrderRepository struct {
	Db *sql.DB
}

type Order struct {
	Id      int
	Product string
	Amount  int
}

```

We created a `OrderRepository` struct that holds the Db connection. This allows us to use it in the methods we will create. We also created an `Order` struct that will hold the order data.

### Creating the order table

Let''s add a method to create the order table.

```go
func (r *OrderRepository) CreateTable() error {
	_, err := r.Db.Exec(`CREATE TABLE IF NOT EXISTS orders (
		id INTEGER PRIMARY KEY AUTOINCREMENT,
		product TEXT,
		amount INTEGER
	)`)

	return err
}
```

We use the `Exec` method to execute the query. The `Exec` method is used for queries that don''t return any data.

- `CREATE TABLE IF NOT EXISTS`: Creates a table only if it doesn''t already exist.
- `INTEGER PRIMARY KEY AUTOINCREMENT`: Sets up a unique identifier for each row that automatically increases.
- `TEXT`: Represents a column for text data.
- `INTEGER`: Represents a column for numeric data.

### Viewing the orders table in a GUI

You can use a GUI tool like `TablePlus` to view the orders table.

Download it from [here](https://tableplus.com/download).

You should now be able to see the orders table in the GUI.

![Orders table in TablePlus](/images/sql-in-go-tableplus.png)

### Inserting an order

Add a method to insert order data into the database.

```go
func (r *OrderRepository) Insert(order Order) error {
	_, err := r.Db.Exec("INSERT INTO orders (product, amount) VALUES (?, ?)", order.Product, order.Amount)
	return err
}
```

`INSERT INTO orders (product, amount) VALUES (?, ?)`: Inserts a new row into the orders table with the product and amount values.

The question marks are placeholders for the values we want to insert.

Always use placeholders instead of concatenating strings to avoid SQL injection.

### Get all orders

```go
func (r *OrderRepository) GetAll() ([]Order, error) {
	rows, err := r.Db.Query("SELECT * FROM orders")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var orders []Order
	for rows.Next() {
		var order Order
		err := rows.Scan(&order.Id, &order.Product, &order.Amount)
		if err != nil {
			return nil, err
		}
		orders = append(orders, order)
	}
	return orders, nil
}
```

First we query the rows from the database using the `Query` method. The query method is used for queries that return data. The `*` is a wildcard it means that we want to select all columns.

We use `defer rows.Close()` to close the rows after we are done with them. This is to avoid memory leaks.

Then we iterate over the rows and scan the data into the `Order` struct. We check if there is an error in scanning the data and return it if there is one.

We append each order to the `orders` slice.

Finally we return the orders.

### Retrieve a single order by id

```go
func (r *OrderRepository) GetById(id int) (Order, error) {
	var order Order
	err := r.Db.QueryRow("SELECT * FROM orders WHERE id = ?", id).Scan(&order.Id, &order.Product, &order.Amount)
	if err != nil {
		return Order{}, err
	}
	return order, nil
}
```

Here we use the `QueryRow` method. Difference between the `Query` method and the `QueryRow` method is that the `Query` method returns multiple rows and the `QueryRow` method returns a single row. Then we pass the id as a placeholder to the where clause and scan the data into the `Order` struct.

If there is an error we return an empty `Order` and the error otherwise we return the order.

### Update an order

```go
func (r *OrderRepository) Update(order Order) error {
	_, err := r.Db.Exec("UPDATE orders SET product = ?, amount = ? WHERE id = ?", order.Product, order.Amount, order.Id)
	return err
}
```

`UPDATE orders SET product = ?, amount = ? WHERE id = ?`: Updates the product and amount columns for the row with the given id.

### Delete an order

```go
func (r *OrderRepository) Delete(id int) error {
	_, err := r.Db.Exec("DELETE FROM orders WHERE id = ?", id)
	return err
}
```

`DELETE FROM orders WHERE id = ?`: Deletes the row with the given id.

### Testing create tables

Let''s try it out. Add the following code to the `main.go` file:

```go
package main

import (
	"database/sql"
	"log"
	"sql-in-go/database"

	_ "github.com/mattn/go-sqlite3"
)

func main() {
	dbConnection, err := sql.Open("sqlite3", "./shop.db")
	if err != nil {
		log.Fatal("Error opening database:", err)
	}
	defer dbConnection.Close()

	orderRepository := &database.OrderRepository{Db: dbConnection}

	err = orderRepository.CreateTable()
	if err != nil {
		log.Fatal("Error creating orders table:", err)
	}
}
```

We create the `OrderRepository` struct and passed the database connection to it.

After that we call the `CreateTable` method for the repository to create the table and check if there are any errors.

Open a terminal and run the following command:

```bash
go run main.go
```

It should create the `shop.db` file and the orders table inside it.

## Inserting and retrieving data

Update the `main.go` file to insert data into the database.

```go
package main

import (
	"database/sql"
	"log"
	"sql-in-go/database"

	_ "github.com/mattn/go-sqlite3"
)

func main() {
	dbConnection, err := sql.Open("sqlite3", "./shop.db")
	if err != nil {
		log.Fatal("Error opening database:", err)
	}
	defer dbConnection.Close()

	orderRepository := &database.OrderRepository{Db: dbConnection}

	err = orderRepository.CreateTable()
	if err != nil {
		log.Fatal("Error creating orders table:", err)
	}

	err = orderRepository.Insert(database.Order{Product: "Laptop", Amount: 10})
	if err != nil {
		log.Fatal("Error inserting order:", err)
	}

	err = orderRepository.Insert(database.Order{Product: "Keyboard", Amount: 50})
	if err != nil {
		log.Fatal("Error inserting order:", err)
	}

	orders, err := orderRepository.GetAll()
	if err != nil {
		log.Fatal("Error getting orders:", err)
	}

	log.Println(orders)
}
```

## Updating & Deleting data

The only thing left to do is to update and delete data.

Update the `main.go` file to update and delete data.

```go
package main

import (
	"database/sql"
	"log"
	"sql-in-go/database"

	_ "github.com/mattn/go-sqlite3"
)

func main() {
	dbConnection, err := sql.Open("sqlite3", "./shop.db")
	if err != nil {
		log.Fatal("Error opening database:", err)
	}
	defer dbConnection.Close()

	orderRepository := &database.OrderRepository{Db: dbConnection}

	err = orderRepository.CreateTable()
	if err != nil {
		log.Fatal("Error creating orders table:", err)
	}

	err = orderRepository.Insert(database.Order{Product: "Laptop", Amount: 10})
	if err != nil {
		log.Fatal("Error inserting order:", err)
	}

	err = orderRepository.Insert(database.Order{Product: "Keyboard", Amount: 50})
	if err != nil {
		log.Fatal("Error inserting order:", err)
	}

	orders, err := orderRepository.GetAll()
	if err != nil {
		log.Fatal("Error getting orders:", err)
	}

	log.Println(orders)

	order, err := orderRepository.GetById(orders[0].Id)
	if err != nil {
		log.Fatal("Error getting order:", err)
	}

	order.Amount = 1500
	err = orderRepository.Update(order)
	if err != nil {
		log.Fatal("Error updating order:", err)
	}

	orders, err = orderRepository.GetAll()
	if err != nil {
		log.Fatal("Error getting orders:", err)
	}

	log.Println(orders)

	err = orderRepository.Delete(order.Id)
	if err != nil {
		log.Fatal("Error deleting order:", err)
	}

	orders, err = orderRepository.GetAll()
	if err != nil {
		log.Fatal("Error getting orders:", err)
	}

	log.Println(orders)
}
```

## Context & Timeout

You can use context and timeout to set a deadline for the query execution.

The `Exec`, `Query`, and `QueryRow` methods also have a context version that takes a context as an argument.

`ExecContext`, `QueryContext`, and `QueryRowContext`.

The reason why we use context and timeout is to avoid blocking the database connection for too long.

```go
ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
defer cancel()

err := r.Db.QueryContext(ctx, "SELECT * FROM orders")
```

Here we get the context from the `context.Background()` function and set a timeout of 5 seconds for the query execution. If the query execution takes longer than 5 seconds, it will be canceled.

## Conclusion

In this tutorial, you learned how to use SQL in Go (Golang) with SQLite. You learned how to create, insert, retrieve, update, and delete data from the database.

Full source code can be found here [Github](https://github.com/patni1992/sql-in-go)

I hope you enjoyed this tutorial and learned something new.
', NULL, NULL, NULL, '0', 'Ready to get started?', 'Get instant access to all content and downloads', 'Buy Now', '1', '0', '0', '0', '0', '1734739320000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '1760425366511', '1760425385637'),
('cmgq88r6n0001y4ha1icumvqm', 'go-golang-tutorial-10-structs', 'Go (Golang) Tutorial 10 - Structs', 'In this tutorial, we’ll learn about structs in Go, which are used to group related data together and create custom types.', '0', 'NONE', 'mpgYS4CZHzk?si=EdIIwDcnNYqhjpjM', '/images/go-golang-tutorial-10-structs-thumb.png', NULL, NULL, NULL, 'In this tutorial, we’ll learn about **structs** in Go. Structs let you group related data together and create custom types, similar to classes in other languages.

## Understanding Structs in Go

### Basic Struct Syntax

To declare and initialize a struct in Go, use the `type` keyword to define a new type, followed by the type name (e.g., `Book`), and the `struct` keyword to specify its fields.

```go
type Book struct {
    Title  string
    Author string
    Pages  int
}

myBook := Book{
    Title:  "The Go Programming Language",
    Author: "Alan A. A. Donovan",
    Pages:  380,
}
```

This example defines a `Book` struct with fields for title, author, and pages, and initializes an instance of it.

Alternatively, you can create an empty struct and assign values to its fields later.

```go
var myBook Book
```

This will create an empty `Book` struct.

To add values to the struct fields, you can use the following syntax:

```go
myBook.Title = "The Go Programming Language"
myBook.Author = "Alan A. A. Donovan"
myBook.Pages = 380

fmt.Println(myBook) // Output will be: {The Go Programming Language Alan A. A. Donovan 380}
```

### Accessing and Modifying Struct Fields

You can read values from a struct using the dot notation.

```go
title := myBook.Title
fmt.Println(title) // Output will be "The Go Programming Language"
```

You can also directly mutate the fields of a struct using the dot notation. For example:

```go
myBook.Title = "New Title"
fmt.Println(myBook.Title) // Output will be "New Title"
```

### Nested Structs

Structs can be nested within other structs to create more complex data structures.

```go
type Library struct {
    Name  string
    Books []Book
}

myLibrary := Library{
    Name: "City Library",
    Books: []Book{
        {Title: "The Go Programming Language", Author: "Alan A. A. Donovan", Pages: 380},
        {Title: "Go in Action", Author: "William Kennedy", Pages: 300},
    },
}
```

This example shows a `Library` struct containing a slice of `Book` structs.

To print a struct with all its fields, you can use the `%+v` format specifier.

```go
fmt.Printf("%+v", myLibrary)

// Output will be: {Name:City Library Books:[{Title:The Go Programming Language Author:Alan A. A. Donovan Pages:380} {Title:Go in Action Author:William Kennedy Pages:300}]}
```

### Struct Methods

You can define methods on structs to add functionality. You write methods as functions with a special receiver argument, which is the struct type it belongs to.

```go
func (b Book) Summary() string {
    return fmt.Sprintf("%s by %s, %d pages", b.Title, b.Author, b.Pages)
}

fmt.Println(myBook.Summary())
```

This method returns a formatted string summarizing the book''s details.

#### Modifying Struct Fields with Methods

To update struct fields in a method, use a pointer receiver. A pointer is a reference to the memory address of the value it points to, so if you don''t use a pointer receiver, the method will only modify a copy of the struct, not the original.

```go
func (b *Book) UpdatePages(newPages int) {
    if newPages > 0 {
        b.Pages = newPages
    } else {
        fmt.Println("Invalid page count. Pages must be greater than zero.")
    }
}

myBook.UpdatePages(400)
fmt.Println(myBook.Pages) // Output will be 400
```

If we would not have used a pointer receiver, the changes would not have been reflected in the original struct.

```go
func (b Book) UpdatePages(newPages int) {
   if newPages > 0 {
        b.Pages = newPages
    } else {
        fmt.Println("Invalid page count. Pages must be greater than zero.")
    }
}

myBook.UpdatePages(400)
fmt.Println(myBook.Pages) // Output will be 380
```

### Comparing Structs

In Go, you can compare structs using the `==` operator. For structs to be equal, all their fields must match exactly.

```go
book1 := Book{Title: "Go in Action", Author: "William Kennedy", Pages: 300}
book2 := Book{Title: "Go in Action", Author: "William Kennedy", Pages: 300}

if book1 == book2 {
    fmt.Println("The books are identical.")
} else {
    fmt.Println("The books are different.")
}
```

The output will be "The books are identical." because the fields match exactly.

### Composition and Interfaces

Go doesn''t support inheritance. Instead, it uses composition to build complex types from simpler ones and interfaces for flexible behavior.

#### Example of Composition

```go
package main

import "fmt"

type Printer struct{}

func (p Printer) Print() {
    fmt.Println("Printing document...")
}

type Scanner struct{}

func (s Scanner) Scan() {
    fmt.Println("Scanning document...")
}

// A struct that combines both Printer and Scanner
type MultiFunctionDevice struct {
    Printer
    Scanner
}

func main() {
    // Create a new MultiFunctionDevice
    mfd := MultiFunctionDevice{}

    mfd.Scan()
    mfd.Print()
}
```

### Anonymous Structs

Anonymous structs are useful for temporary data structures, such as when parsing JSON. They are ideal for one-time use.

```go
package main

import (
    "encoding/json"
    "fmt"
)

func main() {
    jsonResponse := `{"Name": "Alice", "Age": 30}`

    // Use an anonymous struct directly
    person := struct {
        Name string
        Age  int
    }{}

    err := json.Unmarshal([]byte(jsonResponse), &person)
    if err != nil {
        fmt.Println("Error unmarshalling JSON:", err)
        return
    }

    fmt.Printf("Name: %s, Age: %d\n", person.Name, person.Age)
}
```

This example shows how to parse JSON data into an anonymous struct.

## Conclusion

In this tutorial, we explored how to use structs in Go. We covered how to declare and initialize them, access and modify fields, nest structs, define methods, and compare structs. We also looked at using composition to build complex types. Finally, we briefly touched on anonymous structs for temporary data structures.

Full source code can be found here [Github](https://github.com/patni1992/Go-Tutorials/tree/lesson-10)
', NULL, NULL, '1', 'Ready to get started?', 'Get instant access to all content and downloads', 'Buy Now', '1', '0', '0', '0', '0', '1732122840000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '1760426093472', '1763815926387'),
('cmgq8gkgn0002y4halroop8b5', 'go-golang-tutorial-9-maps', 'Go (Golang) Tutorial 9 - Maps', 'In this tutorial, we’ll learn about maps in Go, which are used to efficiently manage collections of key-value pairs.', '0', 'NONE', '8SqH42zO4eU?si=76BAzsX5oIV0ZlNu', '/images/go-golang-tutorial-maps-9.png', NULL, NULL, NULL, '
In this tutorial, we’ll learn about **maps** in Go, which are used to efficiently manage collections of key-value pairs.

## Understanding Maps in Go

### Basic Map Syntax

Here’s how you can declare and initialize a map in Go:

```go
inventory := map[string]int{
    "pens":      100,
    "notebooks": 50,
}
```

This example initializes a map called `inventory` with quantities for pens and notebooks.

Alternatively, you can create an empty map and add items to it later.

```go
inventory := map[string]int{}
```

This will create an empty map with string keys and integer values.

To add items to the map, you can use the following syntax:

```go
inventory["pens"] = 100
inventory["notebooks"] = 50
```

### Accessing Map Values

You can read values from a map using the keys.

```go
quantity := inventory["pens"]
fmt.Println(quantity) // Output will be 100
```

If the key doesn’t exist, it returns the zero value for the map’s value type.

```go
unknownQuantity := inventory["markers"]
fmt.Println(unknownQuantity) // Output will be 0, since "markers" does not exist
```

### Checking for Key Existence

To check if a key exists in a map, use a two-value assignment. The first variable is the key''s value, and the second is a boolean indicating the key''s existence.

```go
v, ok := inventory["paper clips"]
if ok {
    fmt.Println("The inventory has", v, "paper clips")
} else {
    fmt.Println("Paper clips are not in the inventory")
}
```

This will print a message based on whether "paper clips" are in the inventory.

### Deleting Map Entries

You can remove entries from a map using the `delete` function:

```go
delete(inventory, "notebooks")
```

This will remove notebooks from the inventory.

If we now check if notebooks exist in the inventory, it will return false.

```go
_, ok := inventory["notebooks"]
fmt.Println(ok) // Output will be false
```

### Iterating Over Maps

Lets recreate the inventory and add more items to it.

```go
inventory := map[string]int{
    "pens":      100,
    "notebooks": 50,
    "erasers":   30,
}
```

You can loop through a map using a `for` loop:

```go
for item, quantity := range inventory {
    fmt.Printf("There are %d %s in the inventory\n", quantity, item)
}

// Output:
// There are 100 pens in the inventory
// There are 50 notebooks in the inventory
// There are 30 erasers in the inventory
```

This will print each item and its quantity in the inventory.

### Comparing Maps

In Go, you cannot directly compare maps using the `==` operator. The only valid comparison is with `nil` to check if a map is initialized:

```go
if inventory == nil {
    fmt.Println("The inventory map is not initialized")
}
```

With Go 1.21, helper functions are available for map operations. For example, you can use these functions to check if two maps have identical keys and values:

```go
import (
    "fmt"
    "maps"
)

func main() {
    inventory1 := map[string]int{
        "pens":      100,
        "notebooks": 50,
        "erasers":   30,
    }

    inventory2 := map[string]int{
        "pens":      100,
        "notebooks": 50,
        "erasers":   30,
    }

    if maps.Equal(inventory1, inventory2) {
        fmt.Println("The inventories are equal.")
    } else {
        fmt.Println("The inventories are not equal.")
    }
}
```

### Emptying a Map

To empty a map, you can use the `clear` function.

```go
fmt.Println(inventory1) // Output will be map[erasers:30 notebooks:50 pens:100]
clear(inventory1)
fmt.Println(inventory1) // Output will be map[]
```

This method will result in an empty map.

## Conclusion

In this tutorial, we explored how to use maps in Go. We covered how to declare and initialize them, add, access, and remove entries, check if a key exists, and loop through maps. We also looked at some useful helper functions to compare and empty maps.

Full source code can be found here [Github](https://github.com/patni1992/Go-Tutorials/tree/lesson-9)
', NULL, NULL, '1', 'Ready to get started?', 'Get instant access to all content and downloads', 'Buy Now', '1', '0', '0', '0', '0', '1730222400000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '1760426458007', '1763815993349'),
('cmgqtephg0003y4habpptzqcc', 'go-golang-8-functions', 'Go (Golang) 8 - Functions', 'In this tutorial, we’ll explore functions', '0', 'NONE', 'EFDpNI4YROE?', '/images/go-golang-tutorial-8-functions.png', NULL, NULL, NULL, 'In this tutorial, we’ll cover **functions** a fundamental part of Go that helps organize and reuse code efficiently.

## Writing functions in Go

### Basic Function Syntax

Here’s how you write a simple function in Go:

```go
func sayHello() {
    fmt.Println("Hello, Go!")
}
```

This function doesn’t take any arguments or return a value. It just prints a message.

You can call it like this:

```go
sayHello()
sayHello()
sayHello()
```

This will print “Hello, Go!” three times.

### Adding Parameters and Returning Values

Functions can accept arguments and return values. In Go, you must specify the types of both the arguments and the return values.

```go
func add(a int, b int) int {
    return a + b
}
```

This function takes two integers and returns their sum.

```go
add(2, 5) // will return 7
```

### Multiple Arguments of the Same Type

If you have multiple arguments of the same type you only need to write the type one time.

```go
func add(a, b int) int {
    return a + b
}
```

### Multiple Return Values

In Go, functions can return multiple values:

```go
func divide(a, b float64) (float64, error) {
	if b == 0 {
		return 0, errors.New("division by zero is not allowed")
	}
	return a / b, nil
}
```

This divide function returns both a result and an error. If the divisor is zero, it returns an error; otherwise, it returns the result and error is set to `nil`.

It''s a very common pattern in `Go` that the last return value is an error.

When used it would look something like this.

```go
result, err := divide(10, 0)
if err != nil {
	fmt.Println("Error:", err)
} else {
	fmt.Println("Result:", result)
}
```

### Passing functions as an argument

Go allows functions to be passed as arguments:

```go
func apply(slice []int, fn func(int) int) {
	for i, v := range slice {
		slice[i] = fn(v)
	}
}

func double(n int) int {
	return n * 2
}

nums := []int{1, 2, 3, 4, 5}
apply(nums, double)
fmt.Println(nums)  // Output: [2, 4, 6, 8, 10]
```

In this example, the map function loops through a slice and applies the Double function to each element.

The double function could be replaced with any other function. Here is an example of square.

```go
func apply(slice []int, fn func(int) int) {
	for i, v := range slice {
		slice[i] = fn(v)
	}
}

func square(n int) int {
	return n * n
}

nums := []int{1, 2, 3, 4, 5}
Apply(nums, square)
fmt.Println(nums)  // Output: [1, 4, 9, 16, 25]
```

### Variadic Functions

Variadic functions allow you to pass any number of arguments. One example of that is `fmp.println`. Let''s create our own function.

```go
func sum(nums ...int) int {
    total := 0

    for _, num := range nums {
        total += num
    }

	return total
}
```

This function will add together all values you pass and return the sum of them.

```go
package main

import "fmt"

sum(100, 15, 20, 5, 7)
numbers := []int{5,8,10,20}
sum(numbers...)
```

In the first example we call sum with any numbers of arguments and inside the sum function Go will turn it into a slice.

You can also pass a slice as argument but you have to use three dots after it. This will unpack the slice and pass it in as separate arguments

#### Anonymous Function

an anonymous function is a nameless function defined inline, often used for short, one-off tasks. It can be called immediately or assigned to a variable:

```go
func() { fmt.Println("Hello!") }()
```

Or assigned:

```go
greet := func(name string) { fmt.Println("Hello,", name) }
greet("Go")
```

### Closure

A **closure** is a function that remembers variables from its surrounding scope, even after the outer function has returned.

Let’s take a look at a simple closure:

```go
// counter is a function that returns another function, which has a closure
func counter() func() int {
    x := 0 // x is captured by the returned function
    return func() int {
        x++ // Each call to this function will increment x
        return x
    }
}

increment := counter()

fmt.Println(increment()) // Output: 1
fmt.Println(increment()) // Output: 2
fmt.Println(increment()) // Output: 3

// Each time increment is called, it remembers the value of x

```

In this example, the increment function “remembers” the value of x between calls, thanks to the closure.

### Named Return Values and Blank Returns

Go allows you to name your return values. This creates variables that will be used as return values. The inital value of a named return value is it empty value. So `int` is zero and `string` is empty string and so on.

```go
func add(a, b int) (sum int) {
    sum = a + b
    return
}

fmt.Println(add(5,2)) // 7
```

Here we create a named return value called sum. As you can see the return statement is blank. Go will automatically return the named return values when using blank return statement.

if we don''t give sum a value it will return 0.

```go
func add(a, b int) (sum int) {
    return
}

fmt.Println(add(5,2)) // 0
```

My advice is to only use it for very simple functions or not use them at all. If you use it for more complicated functions it becomes very hard to read and keep track of the data flow. Since they are initialized to their zero values you also run the risk of returning unintended results.

Here is one example of a more complicated function.

```go
func complicatedFunction(a, b int) (result int, err error) {
    if a < 0 {
        err = errors.New("a is negative")
        return
    }
    result = a + b
    if result > 100 {
        err = errors.New("too large")
        return
    }
    // more logic
    return
}
```

As you can see it becomes hard to keep track of what is being returned.

## Conclusion

Functions in Go are flexible, allowing you to define reusable code, handle errors, and pass or return other functions. They help make your programs clean and maintainable. I hope you enjoyed this tutorial see you in the next one.

Full source code can be found here [Github](https://github.com/patni1992/Go-Tutorials/tree/lesson-8)', NULL, NULL, '1', 'Ready to get started?', 'Get instant access to all content and downloads', 'Buy Now', '1', '0', '0', '0', '0', '1726999560000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '1760461643140', '1761365189799'),
('cmgqtni3c0004y4ha1ab0wex5', 'go-golang-tutorial-7-loops', 'Go (Golang) 7 - Loops', 'In this tutorial, we’ll explore loops', '0', 'NONE', 's_9E4WDgRLQ', '/images/go-golang-tutorials-7-loops.png', NULL, NULL, 'Loops are crucial in programming as they allow code to run multiple times. In Go, you can write loops in different ways, but they all use the `for` keyword.

## Writing loops in Go

### Three-component loop

This loop in Go works similarly to loops in other languages like C or JavaScript:

```go
for i := 0; i < 10; i++ {
	fmt.Println(i)
}

/* Output
 0
 2
 3
 4
 5
 6
 7
 8
 9
*/
```

- **Initialization:** The loop starts by setting `i` to 0. In Go, you use shorthand (`:=`) for this.
- **Condition:** The loop continues running as long as the condition (`i < 10`) is true.
- **Increment:** After each loop iteration, `i` increases by 1.

This example prints the numbers 0-9. Once `i` is no longer less than 10, the loop stops.

#### Simplifying loops

Sometimes, you don’t need to use all three parts of a loop, which allows you to create different loop patterns. For instance, you might skip the initialization or the increment step.

##### Skipping the Initialization

If the initial value is calculated before the loop starts, you might skip the initialization in the loop itself.

```go
i := 0
for ; i < 10; i++ {
    fmt.Println(i)
}

/* Output
 0
 2
 3
 4
 5
 6
 7
 8
 9
*/
```

##### Skipping the Increment Step

When the increment rules are more complex, you might leave out the increment step in the loop header.

```go
for i := 0; i < 10; {
    fmt.Println(i)
    if i < 5 {
        i += 2
    } else {
        i += 3
    }
}

/* Output
 0
 2
 4
 6
 9
*/
```

This way, you handle the increment inside the loop based on specific conditions.

### While loop

In Go, you can create a while loop using the `for` keyword by skipping the initialization and increment steps.

```go
number := 1
for number <= 10 {
        fmt.Println(number)
        number++;
}

/* Output
 1
 2
 3
 4
 5
 6
 7
 8
 9
 10
 */
```

This example shows a simple while loop where the number starts at 1 and increases until it exceeds 10.

### Infinite loop

To create an infinite loop, you can leave out all three parts of the for loop.

```go
for {
    fmt.Println("This loop will run forever.")
}

/* Output
 This loop will run forever.
 This loop will run forever.
 This loop will run forever.
 This loop will run forever.
 ...
 */
```

To stop the loop, press Ctrl-c.

### Break & continue statements

In Go, the break and continue statements help manage loop execution. Here’s how they work.

#### Break statement

The break statement stops a loop entirely when a certain condition is met.

```go
for i := 1; i <= 10; i++ {
    if i == 5 {
        break // Stops the loop when i reach 5
    }
    fmt.Println(i)
}
/* Output
 1
 2
 3
 4
 */
```

In this example, the loop stops before printing 5, because the break command exits the loop once i equals 5.

#### Continue statement

When the continue statement is triggered it will continue to the next iteration.

```go
for i := 1; i <= 10; i++ {
    if i% 2 == 0 {
        continue // Skips even numbers
    }
    fmt.Println(i)
}

/* Output
 1
 3
 5
 7
 9
 */
```

Here, continue skips the print statement for even numbers. So, only the odd numbers are printed.

Using break and continue allows you to fine-tune how loops operate, either by ending them early or by skipping parts of their execution.

#### Iterate over slices

In the previous tutorial, we learned about slices but didn’t cover how to loop through them. Here’s a simple way to do it:

```go
	languages := []string{"Go", "Java", "C", "Python", "Ruby"}

	for i, lang := range languages {
		fmt.Println(i)
		fmt.Println(lang)
	}

/* Output
 0
 Go
 1
 Java
 2
 C
 3
 Python
 4
 Ruby
 */
```

We use the `range` keyword to step through each item in the list. The for loop then helps us print each item’s position and name. You can use `range` keyword for example with strings, arrays, slices, maps.

If you don’t need the item’s position, you can skip it like this.

```go
	languages := []string{"Go", "Java", "C", "Python", "Ruby"}

	for _, lang := range languages {
		fmt.Println(lang)
	}

/* Output
 Go
 Java
 C
 Python
 Ruby
 */
```

Here, the underscore \_ tells Go that we’re not using the index, so it ignores it.

## Conclusion

In this tutorial, we learned about different loops in Go. These looping techniques are great tools for handling repetitive tasks efficiently in your Go programs. I hope you enjoyed this tutorial.

Full source code can be found here [Github](https://github.com/patni1992/Go-Tutorials/tree/lesson-7)
', 'Loops are crucial in programming as they allow code to run multiple times. In Go, you can write loops in different ways, but they all use the `for` keyword.

## Writing loops in Go

### Three-component loop

This loop in Go works similarly to loops in other languages like C or JavaScript:

```go
for i := 0; i < 10; i++ {
	fmt.Println(i)
}

/* Output
 0
 2
 3
 4
 5
 6
 7
 8
 9
*/
```

- **Initialization:** The loop starts by setting `i` to 0. In Go, you use shorthand (`:=`) for this.
- **Condition:** The loop continues running as long as the condition (`i < 10`) is true.
- **Increment:** After each loop iteration, `i` increases by 1.

This example prints the numbers 0-9. Once `i` is no longer less than 10, the loop stops.

#### Simplifying loops

Sometimes, you don’t need to use all three parts of a loop, which allows you to create different loop patterns. For instance, you might skip the initialization or the increment step.

##### Skipping the Initialization

If the initial value is calculated before the loop starts, you might skip the initialization in the loop itself.

```go
i := 0
for ; i < 10; i++ {
    fmt.Println(i)
}

/* Output
 0
 2
 3
 4
 5
 6
 7
 8
 9
*/
```

##### Skipping the Increment Step

When the increment rules are more complex, you might leave out the increment step in the loop header.

```go
for i := 0; i < 10; {
    fmt.Println(i)
    if i < 5 {
        i += 2
    } else {
        i += 3
    }
}

/* Output
 0
 2
 4
 6
 9
*/
```

This way, you handle the increment inside the loop based on specific conditions.

### While loop

In Go, you can create a while loop using the `for` keyword by skipping the initialization and increment steps.

```go
number := 1
for number <= 10 {
        fmt.Println(number)
        number++;
}

/* Output
 1
 2
 3
 4
 5
 6
 7
 8
 9
 10
 */
```

This example shows a simple while loop where the number starts at 1 and increases until it exceeds 10.

### Infinite loop

To create an infinite loop, you can leave out all three parts of the for loop.

```go
for {
    fmt.Println("This loop will run forever.")
}

/* Output
 This loop will run forever.
 This loop will run forever.
 This loop will run forever.
 This loop will run forever.
 ...
 */
```

To stop the loop, press Ctrl-c.

### Break & continue statements

In Go, the break and continue statements help manage loop execution. Here’s how they work.

#### Break statement

The break statement stops a loop entirely when a certain condition is met.

```go
for i := 1; i <= 10; i++ {
    if i == 5 {
        break // Stops the loop when i reach 5
    }
    fmt.Println(i)
}
/* Output
 1
 2
 3
 4
 */
```

In this example, the loop stops before printing 5, because the break command exits the loop once i equals 5.

#### Continue statement

When the continue statement is triggered it will continue to the next iteration.

```go
for i := 1; i <= 10; i++ {
    if i% 2 == 0 {
        continue // Skips even numbers
    }
    fmt.Println(i)
}

/* Output
 1
 3
 5
 7
 9
 */
```

Here, continue skips the print statement for even numbers. So, only the odd numbers are printed.

Using break and continue allows you to fine-tune how loops operate, either by ending them early or by skipping parts of their execution.

#### Iterate over slices

In the previous tutorial, we learned about slices but didn’t cover how to loop through them. Here’s a simple way to do it:

```go
	languages := []string{"Go", "Java", "C", "Python", "Ruby"}

	for i, lang := range languages {
		fmt.Println(i)
		fmt.Println(lang)
	}

/* Output
 0
 Go
 1
 Java
 2
 C
 3
 Python
 4
 Ruby
 */
```

We use the `range` keyword to step through each item in the list. The for loop then helps us print each item’s position and name. You can use `range` keyword for example with strings, arrays, slices, maps.

If you don’t need the item’s position, you can skip it like this.

```go
	languages := []string{"Go", "Java", "C", "Python", "Ruby"}

	for _, lang := range languages {
		fmt.Println(lang)
	}

/* Output
 Go
 Java
 C
 Python
 Ruby
 */
```

Here, the underscore \_ tells Go that we’re not using the index, so it ignores it.

## Conclusion

In this tutorial, we learned about different loops in Go. These looping techniques are great tools for handling repetitive tasks efficiently in your Go programs. I hope you enjoyed this tutorial.

Full source code can be found here [Github](https://github.com/patni1992/Go-Tutorials/tree/lesson-7)
', NULL, NULL, '1', 'Ready to get started?', 'Get instant access to all content and downloads', 'Buy Now', '1', '0', '0', '0', '0', '1725678720000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '1760462053464', '1763816032864'),
('cmgqttyjx0005y4ha1uw99fj8', 'go-golang-tutorial-6-conditionals', 'Go (Golang) 6 - Conditionals', 'In this tutorial, we’ll explore conditionals', '0', 'NONE', 'h2nVtBH88_s', '/images/go-golang-conditionals-6.png', NULL, NULL, 'In this tutorial, we will take a look at different conditional statements like if, else if, else and switch statements.

## If, else if, else statements

If you have ever used conditionals in different languages you might be familiar with this. Let''s start with the if statement.

```go
goIsAwesome := true
if goIsAwesome {
	fmt.Println("I love Go")
}
```

This will evaluate to true and the if statement will run and print "I love Go". One difference between languages like Java, C is that there are no parentheses.

We can also expand if statements with else if and else.

```go
language := "Go"
if language == "Go" {
	fmt.Println("Keep rocking")
} else if language == "Python" {
	fmt.Println("Solid choice")
} else {
	fmt.Println("Exploring new languages?")
}
```

In case `if` is false it will move on to `else if` and see if it''s true. If all those statements are false it will call the `else` statement.

If you have a variable that you want to be only available for the different conditions you can create it straight in the `if` statement.

```go
foods := []string{"Pizza", "Sushi", "Burger", "Tacos"}

if choice := foods[rand.Intn(len(foods))]; choice == "Pizza" {
	fmt.Println("Pizza is delicious! Great choice.")
} else if choice == "Sushi" {
	fmt.Println("Sushi is a healthy option. Nice!")
} else if choice == "Burger" {
	fmt.Println("Burger is always a good comfort food.")
} else {
	fmt.Println("You like", choice, "which is interesting!")
}
```

Here we create a slice with different foods, and we get a random food and save it to the choice variable. We print food sentences based on the random food. Notice the choice variable it''s declared in the if statement and it will be available for all related conditions. However, it will not be available outside.

## Switch statement

Switch statements are a cleaner alternative for managing multiple conditions.
If you have worked with other languages switch statements are very similar in those.

```go

day := 6
switch day {
    case 1:
      fmt.Println("Sunday")
    case 2:
      fmt.Println("Monday")
    case 3:
      fmt.Println("Tuesday")
    case 4:
      fmt.Println("Wednesday")
    case 5:
      fmt.Println("Thursday")
    case 6:
      fmt.Println("Friday")
    case 7:
      fmt.Println("Saturday")
    default:
      fmt.Println("Invalid day")
  }
```

First, we create a variable day with a value of 6. After that Go will check every case is it equal to the value of day else move on to the next one. In this case it will match case 6 and print out Friday and after that it will stop. Default will be trigged if no other cases is matched.

In other languages you have to add a `break` statement after every case else it would fall through to the other cases. In Go you don''t need to do that it does it for you.

Switch statements can also trigger for multiple values under the same case.

```go
fruit := "banana"

switch fruit {
case "apple", "cherry":
    fmt.Println("Red")
case "banana", "lemon":
    fmt.Println("Yellow")
case "grape", "plum":
    fmt.Println("Purple")
default:
    fmt.Println("Unknown color")
}
```

Here yellow will get printed since it matches the banana case.

You can also use something called blank switches. In the black switch you don''t specify what value you are comparing instead you do a check inside every case that returns a boolean

```go

temperature := 15 // degrees Celsius

switch {
case temperature < 5:
    fmt.Println("Winter")
case temperature >= 5 && temperature < 15:
    fmt.Println("Autumn")
case temperature >= 15 && temperature < 25:
    fmt.Println("Spring")
case temperature >= 25:
    fmt.Println("Summer")
default:
    fmt.Println("Unusual weather")
}
```

This will print out Spring since the temperature is equal to 15.

## Conclusion

Full source code can be found here [Github](https://github.com/patni1992/Go-Tutorials/tree/lesson-6)

In this tutorial, we explored Go’s if-else and switch statements. These tools help you with decision-making. In the next tutorial we are gonna cover loops
', 'In this tutorial, we will take a look at different conditional statements like if, else if, else and switch statements.

## If, else if, else statements

If you have ever used conditionals in different languages you might be familiar with this. Let''s start with the if statement.

```go
goIsAwesome := true
if goIsAwesome {
	fmt.Println("I love Go")
}
```

This will evaluate to true and the if statement will run and print "I love Go". One difference between languages like Java, C is that there are no parentheses.

We can also expand if statements with else if and else.

```go
language := "Go"
if language == "Go" {
	fmt.Println("Keep rocking")
} else if language == "Python" {
	fmt.Println("Solid choice")
} else {
	fmt.Println("Exploring new languages?")
}
```

In case `if` is false it will move on to `else if` and see if it''s true. If all those statements are false it will call the `else` statement.

If you have a variable that you want to be only available for the different conditions you can create it straight in the `if` statement.

```go
foods := []string{"Pizza", "Sushi", "Burger", "Tacos"}

if choice := foods[rand.Intn(len(foods))]; choice == "Pizza" {
	fmt.Println("Pizza is delicious! Great choice.")
} else if choice == "Sushi" {
	fmt.Println("Sushi is a healthy option. Nice!")
} else if choice == "Burger" {
	fmt.Println("Burger is always a good comfort food.")
} else {
	fmt.Println("You like", choice, "which is interesting!")
}
```

Here we create a slice with different foods, and we get a random food and save it to the choice variable. We print food sentences based on the random food. Notice the choice variable it''s declared in the if statement and it will be available for all related conditions. However, it will not be available outside.

## Switch statement

Switch statements are a cleaner alternative for managing multiple conditions.
If you have worked with other languages switch statements are very similar in those.

```go

day := 6
switch day {
    case 1:
      fmt.Println("Sunday")
    case 2:
      fmt.Println("Monday")
    case 3:
      fmt.Println("Tuesday")
    case 4:
      fmt.Println("Wednesday")
    case 5:
      fmt.Println("Thursday")
    case 6:
      fmt.Println("Friday")
    case 7:
      fmt.Println("Saturday")
    default:
      fmt.Println("Invalid day")
  }
```

First, we create a variable day with a value of 6. After that Go will check every case is it equal to the value of day else move on to the next one. In this case it will match case 6 and print out Friday and after that it will stop. Default will be trigged if no other cases is matched.

In other languages you have to add a `break` statement after every case else it would fall through to the other cases. In Go you don''t need to do that it does it for you.

Switch statements can also trigger for multiple values under the same case.

```go
fruit := "banana"

switch fruit {
case "apple", "cherry":
    fmt.Println("Red")
case "banana", "lemon":
    fmt.Println("Yellow")
case "grape", "plum":
    fmt.Println("Purple")
default:
    fmt.Println("Unknown color")
}
```

Here yellow will get printed since it matches the banana case.

You can also use something called blank switches. In the black switch you don''t specify what value you are comparing instead you do a check inside every case that returns a boolean

```go

temperature := 15 // degrees Celsius

switch {
case temperature < 5:
    fmt.Println("Winter")
case temperature >= 5 && temperature < 15:
    fmt.Println("Autumn")
case temperature >= 15 && temperature < 25:
    fmt.Println("Spring")
case temperature >= 25:
    fmt.Println("Summer")
default:
    fmt.Println("Unusual weather")
}
```

This will print out Spring since the temperature is equal to 15.

## Conclusion

Full source code can be found here [Github](https://github.com/patni1992/Go-Tutorials/tree/lesson-6)

In this tutorial, we explored Go’s if-else and switch statements. These tools help you with decision-making. In the next tutorial we are gonna cover loops
', NULL, NULL, '1', 'Ready to get started?', 'Get instant access to all content and downloads', 'Buy Now', '1', '0', '0', '0', '0', '1724986200000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '1760462354734', '1763816078178'),
('cmgqu0qb00006y4hacsv6ekw3', 'go-golang-tutorial-5-arrays-and-slices', 'Go (Golang) 5 - Arrays & Slices', 'In this tutorial, we’ll explore arrays and slices', '0', 'NONE', 'lsMlXqZMZLA', '/images/go-golang-tutorial-5-arrays-slices.png', NULL, NULL, NULL, 'In this tutorial, we’ll explore arrays and slices. You’ll learn about their use cases, key differences, when to choose one over the other, and practical ways to use them.

## Understanding Arrays and Slices in Go

### Arrays

Like most languages, Go has arrays. While you''ll often use slices, it''s important to understand arrays because slices use them under the hood and they have their own use cases.

An array is a sequence of elements that share the same type. They are fixed in size, meaning the length of the array is defined when you create it and cannot be changed.

#### Declaring arrays

Here are some ways you can declare an array in Go.

```go
var zeroArray [5]int
```

This will create an array with a length of 5. Since we did not specify any values Go will set all elements to zero values which is zero for `int`. If we had done the same for `string` the elements in the array would have been empty strings.

If you already know what values you want you can specify it like this.

```go
var myArray = [3]int {5, 10, 15}
```

If we don''t wanna set all values we can choose to specify at what index we wanna set them.

```go
var cars = [5]string{1: "Volvo", 4: "BMW"}
```

You can replace the number that specifies the size of the array with three dots. It will then determine the length of the array based on the number of elements provided

```go
var snacks = [...]string{"chips", "popcorn", "peanuts"}
```

If we print the values of the arrays we created we will get the following output

```go
fmt.Println(zeroArray) // 0, 0, 0, 0, 0
fmt.Println(myArray) // 5, 10, 15
fmt.Println(cars) // "", "Volvo", "", "", "BMW"
fmt.Println(snacks) // chips, popcorn, peanuts
```

#### Get the length of an array

To get the length of an array you can use the built-in function `len`

```go
fmt.Println(len(snacks)) // 3
```

#### Comparing arrays

You can also compare two arrays.

```go
x := [3]int {1, 2, 3}
y := [3]int {1, 2, 3}

fmt.Println(x == y) // true
fmt.Println(x != y) // false
```

Arrays will be equal if they have the same length, contain the same elements, and are in the same order.

#### Updating elements in an array

To update elements in an array you can use this syntax.

```go
x[0] = 10
fmt.Println(x[0]) // 10
fmt.Println(x) // 10, 2, 3
```

Name of the array followed by brackets and the index you want to update and set a new value.

If you try to target an index that does not exist Go will panic and you will get an error.

If you know the length ahead of time, you can use arrays. However, if the length is uncertain, it’s better to use slices

### Slices

Slices can change in size, allowing you to add or remove elements. Operations like `append`, `copy`, and slicing subsets are common with slices, providing a versatile tool for managing collections of data

#### Declaring slices

Slices look very similar to arrays but you don''t specify a size.

```go
someSlice := []int{5,10,15}
```

Same as with arrays you can can specify what indexes you wanna set.

```go
var carsSlice = []string{1: "Volvo", 4: "BMW"} // ["", "Volvo", "", "", "BMW"]
```

When declaring a slice without giving any values it will be set to a zero value and for slices that is `nil`. In Go, nil is used to represent that something doesn’t have any value assigned to it yet.

```go
var sliceWithNoValue []int
```

#### Updating elements in a slice

Reading values values works the same as arrays. You can also update a value by index.

```go
someSlice[2] = 100
fmt.Println(someSlice[2]) // 100
```

#### Comparing slices

You can''t compare slices like we did with arrays. You can only compare it with `nil`

```go
fmt.Println(sliceWithNoValue == nil) // true
fmt.Println(sliceWithNoValue != nil) // false
```

To check if one slice is equal to another slice you have to use the `Equal` function

```go
fruits1 := []string{"apple", "banana", "peach"}
fruits2 := []string{"apple", "banana", "peach"}

fmt.Println(slices.Equal(fruits1, fruits2)) // true
```

You can only use the `Equal` function on slices that are of the same type.

#### Get the length of slices

To check the length of a slice we can use the `len` function same as with arrays.

```go
fmt.Println(len(fruits1)) // 3
fmt.Println(len(sliceWithNoValue)) // 0
```

if `len` is used on a `nil` slice it will return 0.

#### Appending values to a slice

To add values to a slice, you can use the `append` function. This function doesn’t modify the original slice. Instead, it returns a new slice that includes the added values, which you must assign to capture the changes.

```go
fruits1 = append(fruits1, "coconut")
fmt.Println(fruits1) // apple, banana, peach, coconut
```

It''s also possible to append multiple values at a time.

```go
fruits1 = append(fruits1, ''strawberry, raspberry'')
fmt.Println(fruits1) // apple, banana, peach, coconut, strawberry, raspberry
```

To append the values of another slice you can use the ellipsis operator

```go
var fruits3 = []string{"durian", "dragonfruit"}
fruits1 = append(fruits3...)
fmt.Println(fruits1) // apple, banana, peach, coconut, strawberry, raspberry, durian, dragonfruit
```

This will unpack `fruits3` and pass all elements as arguments.

#### How slices grow

Slices in Go are built on arrays, giving them a capacity that defines how many elements they can hold before needing to resize. For example, if a slice with a capacity of 3 requires a fourth element, Go creates a larger array and transfers the elements to it. The resizing rules are as follows.

• For small slices (fewer than 1024 elements), capacity doubles.
• For larger slices (1024 elements or more), capacity increases by about 25% each time.

To check the capacity of a slice in go you can use the `cap` function. Let''s also see how Go increases the capacity of the slice.

```go
var nums []int
fmt.Println(nums, len(nums), cap(nums)) // [] 0 0
nums = append(nums, 1)
fmt.Println(nums, len(nums), cap(nums)) // [1] 1 1
nums = append(nums, 2)
fmt.Println(nums, len(nums), cap(nums)) // [1 2] 2 2
nums = append(nums, 3)
fmt.Println(nums, len(nums), cap(nums)) // [1 2 3] 3 4
nums = append(nums, 4)
fmt.Println(nums, len(nums), cap(nums)) // [1 2 3 4] 4 4
nums = append(nums, 5)
fmt.Println(nums, len(nums), cap(nums)) // [1 2 3 4 5] 5 8
```

As you can see every time we add an element and exceed the capacity Go increases it (in this case doubling it).

If you know the capacity you need for a slice, you can use the `make` function to set it upfront. This helps optimize your code.

```go
nums2 := make([]int, 0, 20) // Set the length to 0 & capacity to 20
nums2 = append(nums2, 5, 10, 15, 20) // nums2 will have a length of 4 & capacity of 20
```

This way, appending elements doesn’t require resizing the slice, because it already has the necessary capacity.

#### Slicing slices

to get a subset of a slice (this can be used on arrays too) you can use something called slicing

```go
nums3 := []int{2,4,8,16,32}
fmt.Printl(nums3[1:4]) // 4, 8 16
```

The number to the left of the colon indicates the starting position and includes that element. The number to the right is the end position but excludes that element, which is why the result is 4, 8, 16.

You can also omit the start and end index.

```go
fmt.Println(nums3[:4])
fmt.Println(nums3[1:])
fmt.Println(nums3[:])
```

- Leaving out the start index (e.g., :end) starts the slice at the first element.
- Leaving out the end index (e.g., start:) extends the slice to the last element.

Be aware of that when using slicing it will not create a copy of the elements it will still use the same reference.

```go
nums4[0] = 1337

fmt.Println(nums3) // 2,1337,8,16,32
fmt.Println(nums4) // 1337,8,16
```

When modifying nums4 it will also update nums3 since they are using the same array under the hood.

#### Removing an item from a slice

Now that you understand how slicing works, you can remove an element from a slice by adjusting its positions and using the `append` function. Since there’s no built-in function for removing elements, this must be done manually. Here’s an approach to remove an element at a specific position.

```go
s := []int{10, 20, 30, 40}
s = append(s[:2], s[2+1:]...)
fmt.Println(s) // 10, 20, 40,
```

This code removes the third element (30) from the slice containing `[10, 20, 30, 40]`. It does this by slicing the elements before and after the third element and combining them with append. The slice `[10, 20, 40]` is printed, confirming that 30 has been successfully removed.

#### Copying a slice

If you want to create a copy you can use the `copy` function. You pass the destination as the first argument and the source slice to copy from as the second argument.

```go
values := []int{5,6,7,8}
newValues := make([]int, 4)
copy(newValues, values)
newValues[0] = 1337
fmt.Println(newValues) // 1337, 6 ,7 ,8
fmt.Println(values)  // 5, 6 ,7 ,8
```

To copy all the values of the first slice the second slice needs to at least have the same length as the first slice if it does not all values will not be copied over.

When we update `newValues`, `values` will stay the same.

## **Conclusion**

Full source code can be found here [Github](https://github.com/patni1992/Go-Tutorials/tree/lesson-5)

Choosing between arrays and slices depends on your needs. Arrays are simple and fast for fixed-size collections, while slices offer flexibility for dynamic data. With this tutorial, you should now have a deeper understanding of how to effectively use them.
', NULL, NULL, '1', 'Ready to get started?', 'Get instant access to all content and downloads', 'Buy Now', '1', '0', '0', '0', '0', '1723294200000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '1760462670637', '1763816218687');
INSERT INTO "Product" ("id", "slug", "name", "description", "price", "icon", "youtubeUrl", "imageUrl", "thumbnailUrl", "fileUrl", "salesCopy", "content", "features", "curriculum", "showToc", "ctaTitle", "ctaDescription", "ctaText", "active", "featured", "comingSoon", "hidden", "order", "publishDate", "metaTitle", "metaDescription", "keywords", "author", "ogImageUrl", "canonicalUrl", "noIndex", "createdAt", "updatedAt") VALUES
('cmgs1loal0000y40yulgvji8b', 'go-golang-tutorial-4-print-formatting-and-input', 'Go (Golang) Tutorial 4 - Print Formatting and Input', 'In this tutorial, we''ll explore print, formatting and reading user input in Go.', '0', 'NONE', 'urDAOcgglJI?si', '/images/print-format-input.png', NULL, NULL, 'In this tutorial, we will learn about the `fmt` package.
By the end of this tutorial, you''ll have a solid understanding of the `fmt` package covering everything from printing, formatting data, and reading input.

## Printing data

We have already seen how to use the `Println` method. One alternative method is called `Print`.

```go
fmt.Print("Hello!")
fmt.Print("Go is awesome")
```

This will not insert any new line and both print statements will end up on the same line. If we would like to add a newline we have 2 options.

We can use the escape key `\n` and it will add a new line.

```go
fmt.Print("Hello!\n")
fmt.Print("Go is awesome")
```

We could also replace it by using `Println` and the result will be the same

```go
fmt.Println("Hello!")
fmt.Println("Go is awesome")
```

It''s possible to pass multiple values to the print statement and it will output all of them.fmt

```go
fmt.Print("My name is", "Patrik")
```

We can also output variables to the console

```go
name := "Patrik"
lang := "Go"

fmt.Println("My name is", name)
fmt.Println("I love the" + lang + " programming language")
```

## Formatting data

### Printf & Sprintf

In Go we can also use something called formatting. It simplifies inserting variables into text, making the code more readable and easier to manage.

To format data We can use the `Printf` method.

```go
name := "Patrik"
countBurgers := 2

fmt.Printf("My name is %s and I had %d burgers today!", name, age)
```

`%s` and `%d` are placeholders inserted into strings and indicate the type of data and its display format.

There is also an alternative method called `Sprintf` instead of priting the formatted string it will return it.

```go
name := "Patrik"
countBurgers := 2

sentence := fmt.Sprintf("My name is %s and I had %d burgers today!", name, age)

fmt.Println(sentence)
```

### Format Specifiers

Here are the different Format Specifiers grouped by type that can be used when formatting data.

#### General

- `%v` Default format for the variable
- `%#v` A Go-syntax representation of the value
- `%T` Prints the type of the value

#### Boolean

- `%t` Boolean (`true` or `false`)

#### Integer

- `%d` Decimal integer
- `%b` Binary integer
- `%o` Octal integer
- `%x` Hexadecimal integer (lowercase letters)
- `%X` Hexadecimal integer (uppercase letters)
- `%c` The character represented by the corresponding Unicode code point
- `%q` A single-quoted character literal safely escaped with Go syntax.

#### Floating-Point and Complex Numbers

- `%f` Decimal floating point, no exponent
- `%b` Scientific notation (with binary exponent), e.g., `-123456p-78`
- `%e` Scientific notation, e.g., `-1.234456e+78`
- `%E` Scientific notation, e.g., `-1.234456E+78`
- `%g` Compact representation (chooses `%e` or `%f` automatically)
- `%G` Compact representation (chooses `%E` or `%F` automatically)

#### String and Slices

- `%s` String or slice of bytes
- `%q` A double-quoted string safely escaped with Go syntax
- `%x` Base 16, lowercase letters, two characters per byte of the argument
- `%X` Base 16, uppercase letters, two characters per byte of the argument

#### Pointer

- `%p` Pointer address

#### Width and Precision

- `%.2f` Floating point with 2 digits after the decimal point
- `%9f` Floating point with 9 characters width
- `%9.2f` Width of 9 and precision of 2
- `%9s` String with a minimum width of 9 characters, right-justified by default
- `%-9s` String with a minimum width of 9 characters, left-justified

#### Padding and Alignment

- `%05d` Integer padded with zeros to a width of 5 digits
- `% 5d` Integer right-aligned in a field of 5 characters wide
- `%-5s` String left-aligned in a field of 5 characters wide

## Reading user input

So far we have only been printing data but what if we want to read user input. To do this we can use the `Scan` method.

```go
var name string
var age int

fmt.Println("Enter your name: ")
fmt.Scan(&name)

fmt.Println("Enter your age: ")
fmt.Scan(&age)

fmt.Printf("Hello, %s! You are %d years old.\n", name, age)
```

First, we declare two variables. After that, we ask the user to enter their name. Next, we use the `Scan` method to receive the user input. Notice we put `&` before the variable, the reason for this is we want to pass the memory address of the variable so the scan method can update that address with the received value. After that, we do the same for the age. As a last step, we print out the values using the `Printf` method.

You can also scan multiple values with 1 `Scan`statement.

```go
var favColor1 string
var favColor2 string


fmt.Println("Enter your two favorite colors: ")
fmt.Scan(&favColor1, &favColor2)

fmt.Println("favorite colors ", favColor1, favColor2)
```

This reads input values until it encounters spaces or newlines, and it assigns them to `favColor1` and `favColor2`. The function continues to prompt until all specified variables are filled, allowing inputs across multiple lines.

If you want both values to be read from the same line you can use `Scanln`

```go
var favColor1 string
var favColor2 string


fmt.Println("Enter your two favorite colors: ")
fmt.Scanln(&favColor1, &favColor2)

fmt.Println("favorite colors ", favColor1, favColor2)
```

It reads all required input from a single line, separated by spaces, and assigns them to the variables in one go.

If we can the input to match a specific format we can use the method `Scanf`.

```go
var favColor1 string
var favColor2 string

fmt.Println("Enter your two favorite colors separated by a comma (e.g., red,blue): ")

fmt.Scanf("%s,%s", &favColor1, &favColor2)

fmt.Printf("Your favorite colors are: %s and %s.\n", favColor1, favColor2)
```

We use the `fmt.Scanf` with `%s,%s` to tell Go to expect two string inputs separated by a comma. `fmt.Printf` formats and displays a message with the user''s favorite colors.

## Conclusion

Full source code can be found here [Github](https://github.com/patni1992/Go-Tutorials/tree/lesson-4)

In this tutorial, we''ve explored how to print, format, and read data in Go using the `fmt` package. We covered basic printing with `fmt.Print` and `fmt.Println`, detailed formatting with `fmt.Printf` and `fmt.Sprintf`, and how to capture user input with`fmt.Scan`, `fmt.Scanln`, and `fmt.Scanf`. In the next tutorial, we gonna talk about arrays & slices.
', 'In this tutorial, we will learn about the `fmt` package.
By the end of this tutorial, you''ll have a solid understanding of the `fmt` package covering everything from printing, formatting data, and reading input.

## Printing data

We have already seen how to use the `Println` method. One alternative method is called `Print`.

```go
fmt.Print("Hello!")
fmt.Print("Go is awesome")
```

This will not insert any new line and both print statements will end up on the same line. If we would like to add a newline we have 2 options.

We can use the escape key `\n` and it will add a new line.

```go
fmt.Print("Hello!\n")
fmt.Print("Go is awesome")
```

We could also replace it by using `Println` and the result will be the same

```go
fmt.Println("Hello!")
fmt.Println("Go is awesome")
```

It''s possible to pass multiple values to the print statement and it will output all of them.fmt

```go
fmt.Print("My name is", "Patrik")
```

We can also output variables to the console

```go
name := "Patrik"
lang := "Go"

fmt.Println("My name is", name)
fmt.Println("I love the" + lang + " programming language")
```

## Formatting data

### Printf & Sprintf

In Go we can also use something called formatting. It simplifies inserting variables into text, making the code more readable and easier to manage.

To format data We can use the `Printf` method.

```go
name := "Patrik"
countBurgers := 2

fmt.Printf("My name is %s and I had %d burgers today!", name, age)
```

`%s` and `%d` are placeholders inserted into strings and indicate the type of data and its display format.

There is also an alternative method called `Sprintf` instead of priting the formatted string it will return it.

```go
name := "Patrik"
countBurgers := 2

sentence := fmt.Sprintf("My name is %s and I had %d burgers today!", name, age)

fmt.Println(sentence)
```

### Format Specifiers

Here are the different Format Specifiers grouped by type that can be used when formatting data.

#### General

- `%v` Default format for the variable
- `%#v` A Go-syntax representation of the value
- `%T` Prints the type of the value

#### Boolean

- `%t` Boolean (`true` or `false`)

#### Integer

- `%d` Decimal integer
- `%b` Binary integer
- `%o` Octal integer
- `%x` Hexadecimal integer (lowercase letters)
- `%X` Hexadecimal integer (uppercase letters)
- `%c` The character represented by the corresponding Unicode code point
- `%q` A single-quoted character literal safely escaped with Go syntax.

#### Floating-Point and Complex Numbers

- `%f` Decimal floating point, no exponent
- `%b` Scientific notation (with binary exponent), e.g., `-123456p-78`
- `%e` Scientific notation, e.g., `-1.234456e+78`
- `%E` Scientific notation, e.g., `-1.234456E+78`
- `%g` Compact representation (chooses `%e` or `%f` automatically)
- `%G` Compact representation (chooses `%E` or `%F` automatically)

#### String and Slices

- `%s` String or slice of bytes
- `%q` A double-quoted string safely escaped with Go syntax
- `%x` Base 16, lowercase letters, two characters per byte of the argument
- `%X` Base 16, uppercase letters, two characters per byte of the argument

#### Pointer

- `%p` Pointer address

#### Width and Precision

- `%.2f` Floating point with 2 digits after the decimal point
- `%9f` Floating point with 9 characters width
- `%9.2f` Width of 9 and precision of 2
- `%9s` String with a minimum width of 9 characters, right-justified by default
- `%-9s` String with a minimum width of 9 characters, left-justified

#### Padding and Alignment

- `%05d` Integer padded with zeros to a width of 5 digits
- `% 5d` Integer right-aligned in a field of 5 characters wide
- `%-5s` String left-aligned in a field of 5 characters wide

## Reading user input

So far we have only been printing data but what if we want to read user input. To do this we can use the `Scan` method.

```go
var name string
var age int

fmt.Println("Enter your name: ")
fmt.Scan(&name)

fmt.Println("Enter your age: ")
fmt.Scan(&age)

fmt.Printf("Hello, %s! You are %d years old.\n", name, age)
```

First, we declare two variables. After that, we ask the user to enter their name. Next, we use the `Scan` method to receive the user input. Notice we put `&` before the variable, the reason for this is we want to pass the memory address of the variable so the scan method can update that address with the received value. After that, we do the same for the age. As a last step, we print out the values using the `Printf` method.

You can also scan multiple values with 1 `Scan`statement.

```go
var favColor1 string
var favColor2 string


fmt.Println("Enter your two favorite colors: ")
fmt.Scan(&favColor1, &favColor2)

fmt.Println("favorite colors ", favColor1, favColor2)
```

This reads input values until it encounters spaces or newlines, and it assigns them to `favColor1` and `favColor2`. The function continues to prompt until all specified variables are filled, allowing inputs across multiple lines.

If you want both values to be read from the same line you can use `Scanln`

```go
var favColor1 string
var favColor2 string


fmt.Println("Enter your two favorite colors: ")
fmt.Scanln(&favColor1, &favColor2)

fmt.Println("favorite colors ", favColor1, favColor2)
```

It reads all required input from a single line, separated by spaces, and assigns them to the variables in one go.

If we can the input to match a specific format we can use the method `Scanf`.

```go
var favColor1 string
var favColor2 string

fmt.Println("Enter your two favorite colors separated by a comma (e.g., red,blue): ")

fmt.Scanf("%s,%s", &favColor1, &favColor2)

fmt.Printf("Your favorite colors are: %s and %s.\n", favColor1, favColor2)
```

We use the `fmt.Scanf` with `%s,%s` to tell Go to expect two string inputs separated by a comma. `fmt.Printf` formats and displays a message with the user''s favorite colors.

## Conclusion

Full source code can be found here [Github](https://github.com/patni1992/Go-Tutorials/tree/lesson-4)

In this tutorial, we''ve explored how to print, format, and read data in Go using the `fmt` package. We covered basic printing with `fmt.Print` and `fmt.Println`, detailed formatting with `fmt.Printf` and `fmt.Sprintf`, and how to capture user input with`fmt.Scan`, `fmt.Scanln`, and `fmt.Scanf`. In the next tutorial, we gonna talk about arrays & slices.
', NULL, NULL, '1', 'Ready to get started?', 'Get instant access to all content and downloads', 'Buy Now', '1', '0', '0', '0', '0', '1721344680000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '1760535871293', '1763816252699'),
('cmgs1rg340001y40yb2a4svcj', 'go-golang-tutorial-3-variables-types', 'Go (Golang) Tutorial 3 - Variables & Types', 'In this tutorial, we''ll explore variables and data types in Go.', '0', 'NONE', 'gxn-Updc_OE', '/images/go-golang-tutorials-variables-types.png', NULL, NULL, NULL, 'Welcome back to this Go programming series! In this video, we''ll explore variables and data types in Go.

## Strings & Declare variable

To declare a variable in go. We type `var`, then the name of the variable, followed by its type.

```go
var animal1 string = "cat"
```

You can also create a variable without specifying the type. Go will then infer the type.

```go
var animal2 = "dog"
```

There is a shorthand way to declare variables in Go. This can only be used in functions. If you are outside a function use var instead.

```go
animal3 := "monkey"
```

You can skip giving the variable a value and Go will give it a default value. For strings Go will assign the empty string as a value.

```go
var animal4 string
animal4 = "lion"
```

We can only change the value to the same type. We can''t for example give a string variable value 10.

Variables without an explicit value initial value are given their zero value.

- `0` for numeric types,
- `false` for the boolean type, and
- `""` (the empty string) for strings.

```go
package main

import "fmt"

func main() {
	var animal1 string = "cat"
	var animal2 string = "dog"
	animal3 := "monkey"
	var animal4 string
	animal4 = "lion"

	var defaultNum int
	var defaultBool bool
	var defaultStr string

	fmt.Println(animal1, animal2, animal3, animal4) // cat dog monkey lion
	fmt.Println(defaultNum, defaultBool, defaultStr) // 0 false ""
}
```

### Variable Declaration Block

Go has something called a Variable declaration block which lets you declare multiple variables together using a single `var` keyword followed by parentheses.

```go
var (
    name    string = "John"
    age     int    = 30
    address string = "123 Go Street"
)
```

It''s a neat way to group and initialize several variables at once, making your code cleaner and more organized.

### Constans

In Go, constants are fixed values that you define with the `const` keyword and cannot be changed after they are set. Constants can be character, string, boolean, or numeric values.

```go
package main

import "fmt"

func main() {
	const pi = 3.14
	const port = 1337

	fmt.Println("Pi: ", pi)
	fmt.Println("Port: ", Port)
}

```

## Data types

### String type

Strings are immutable sequences of characters, declared using double quotes ("").

### Int type

The way we use numbers can be split into two main groups: those that can be negative (signed) and those that can''t (unsigned). Each type of number has different sizes

#### Signed Integers (Can be Negative)

- **int8**: Very small numbers, from -128 to 127.
- **int16**: Small numbers, from -32,768 to 32,767.
- **int32**: Medium numbers, from -2,147,483,648 to 2,147,483,647.
- **int64**: Large numbers, from -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807.
- **int**: This one adjusts based on your computer''s architecture.

#### Unsigned Integers (Only Positive Numbers)

- **uint8**: Tiny numbers, from 0 to 255.
- **uint16**: Small numbers, from 0 to 65,535.
- **uint32**: Medium numbers, from 0 to 4,294,967,295.
- **uint64**: Large numbers, from 0 to 18,446,744,073,709,551,615.
- **uint**: Like `int`, this adjusts to your computer''s architecture.

In Go, the size of `int` and `uint` types is automatically optimised to match the architecture of your computer, either 32-bit or 64-bit

```go
package main

import "fmt"

func main() {
	var num1 int  = 1992
	var num2 int64 = 123456789
	var num3 int8 = 128 // err to big max number is 127
	var num4 uint = -100 // err can''t be negative

	fmt.Println(num1, num2, num3)

}
```

This will output an error for `num3` since 128 is too big for int8. It only supports values between -128 to 127. It will also throw an error on `num4` since we are not allowed to give it a negative value.

When you need an integer value you should use `int` unless you have a specific reason to use a sized or unsigned integer type.

### Float type

In Go, floating-point numbers are used to handle decimals and fractions. There are two main types:

- **float32**: This type is good for when you need to save memory and don''t require high precision. It can handle about 7 decimal digits accurately, making it suitable for basic applications.

- **float64**: This type offers more precision, up to about 15 decimal digits, which is better for scientific calculations or any scenario where accuracy is crucial.

Floats are essential for representing numbers that aren''t whole, like measurements, currency values, or percentages.

```go
package main

import "fmt"

func main() {
	var amount1 float32 = 99.84
	var amount2 float64 = 109.5
	amount3 := 56.7433 // When using shorthand it will default to float64

}
```

Using `float64` in Go is preferred because it''s more accurate for numbers with decimals and helps avoid mistakes in calculations. It’s a safer choice for most tasks, especially since the extra memory usage is usually not a concern.

### Boolean type

A boolean (or bool) is a simple type that holds only two values: `true` or `false`. It''s used to make decisions in your code, like checking conditions or controlling program flow with if-else statements.

```go
package main

import "fmt"

func main() {
	var isTrue bool = true
	isFalse := false

	fmt.Println(isTrue, isFalse)
}
```

### Other basic types

```go

// byte is an alias for uint8
// is used to represent a byte of data (values from 0 to 255).
// commonly used when dealing with raw binary data,
// like files or network connections.
var b byte = 255

// rune is an alias for int32
// is used to represent a Unicode code point.
// Useful when working with individual characters in a string.
var r rune = ''A''

// complex64 is a complex number with float32 real and imaginary parts.
// Used in arithmetic math
var c64 complex64 = 1 + 2i

// complex128 is a complex number with float64 real and imaginary parts.
// provides higher precision than complex64.
var c128 complex128 = 1.0 + 2.0i

```

In Go, `byte` and `rune` are alias types that provide clearer, more descriptive naming for existing types.

A complex type is a number with both a real and an imaginary part, represented as `complex64` or `complex128`, useful for performing complex arithmetic operations.

## Conclusion

Full source code can be found here [Github](https://github.com/patni1992/Go-Tutorials/tree/lesson-3)

In this tutorial, we learned about different types in Go, like strings, integers, floats, and booleans. We also talked about variables and how to use & declare them. I hope you enjoyed this tutorial, Thank you so much see you in the next episode.
', NULL, NULL, '1', 'Ready to get started?', 'Get instant access to all content and downloads', 'Buy Now', '1', '0', '0', '0', '0', '1719768540000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '1760536140592', '1763816305537'),
('cmgs2s3ql0002y40yids3bdg0', 'go-golang-tutorial-2-running-your-first-go-program', 'Go (Golang) Tutorial 2 - Running Your First Go Program', 'n this video, you will write your first Go (Golang) program and run it.', '0', 'NONE', 'm_vpzkBLaFw', '/images/go-golang-tutorial-your-first-go-program.png', NULL, NULL, NULL, '## Running your first Go program

### Creating Your Go Program

Is time to write your first Go program. Open your favourite editor I will be using VS code. After that Create a new file called `main.go` with the following code.

```go
package main

import "fmt"

func main() {
    fmt.Println("Hello, world!")
}
```

Let''s break down this code.

In Go, every file is part of a package, and this is specified at the beginning of the file with the `package` keyword. A package is a collection of related functions and files.

`package main`: `main` is a special name that tells Go this is the entry point of the program.

`func main()`It''s the first function that gets executed. If you skip the `func main()` in the `main` package you will get the following error when trying to run the program.

`program runtime.main_main·f: function main is undeclared in the main package`

`import "fmt"`: This line includes the `fmt` package. The `fmt` package provides functions for formatted input and output, like printing text.

`fmt.Println("Hello, World!")`: This line outputs the string `Hello, World!` to the console.

If you want a function to be accessible from other packages, its name must start with a capital letter. This rule applies to any item you want to export, making it available to other packages.

### Running the Program

To run the program:

1. Open a terminal in VS Code by selecting Terminal > New Terminal from the menu.
2. Run the command `go run main.go` in the terminal. You should see the output "Hello, Go!" in the terminal.

![Terminal Hello World Output](/images/terminal-hello-world-output.png)

### Compiling the Program

To compile the program into an executable:

In the terminal, type the command `go build main.go`. This command creates an executable file named `main` in the same directory.

Compiling your Go program into an executable makes it easy to run on any computer without Go installed.

To run your compiled executable:

1. On Unix-based systems (like Linux or macOS), type `./main` in the terminal and press Enter.
2. On Windows systems, type `main.exe` and press Enter.

## Conclusion

Full source code can be found here [Github](https://github.com/patni1992/Go-Tutorials/tree/lesson-2)

By following these steps, you''ve created and run your first simple Go program and compiled it into an executable file. See you in the next tutorial where you will learn about variables & types.
', NULL, NULL, '1', 'Ready to get started?', 'Get instant access to all content and downloads', 'Buy Now', '1', '0', '0', '0', '0', '1719597780000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '1760537850861', '1763816336994'),
('cmgs33euj0003y40yclridac9', 'go-golang-tutorial-1-introduction-and-getting-started', 'Go (Golang) Tutorial 1 - Introduction & Getting Started', 'Welcome to this introductory tutorial on Go (Golang) programming. In this video, you''ll learn the basics you need to get started with Go.', '0', 'NONE', 'zfwg8w2hhT8', '/images/golang-go-tutorial-introduction.png', NULL, NULL, 'Go, also known as Golang, is an open-source programming language developed by Google. Known for its efficiency and backed by a robust community, Go has become a popular choice for developers worldwide, leading to many job opportunities.

### Key Features and Benefits of Learning Go:

**Static Typing:** Go uses static typing. This means it checks your code for errors before it runs, helping prevent problems when your program is actually used. It catches many mistakes early, making your programs safer.

**Simple Syntax:** Go''s syntax is very simple and clear. It''s easy to learn and doesn''t confuse programmers. This helps you spend more time making your applications instead of trying to understand complex code.

**Single Binary Compilation:** When you compile a Go program, it becomes a single file that can run on its own. You don’t need other software to run it. This simplifies deployment.

**Concurrency Support:** Go supports concurrency naturally with features like goroutines and channels. These help your programs do many things at the same time efficiently, making them faster and more responsive without making the code complex.

**Comprehensive Standard Library:** Go has a large standard library that covers many common programming tasks. This library reduces your need for external packages, makes development faster, and helps you build applications more quickly.

**High Performance:** Go is as fast as languages like C or C++. It compiles directly to machine code, making efficient use of system resources. This is very important for applications that need to be fast and reliable.

### Why Learn Go?

Learning Go can significantly advance your programming skills and career prospects. Its growing use in backend development, cloud services, and system programming means that proficiency in Go is highly valued in the tech industry. Moreover, its design philosophy of simplicity and efficiency makes it an excellent choice for both beginners and experienced programmers looking to enhance their toolkit.

## Installing go

Visit [go.dev](https://go.dev/) click on the download button.

![Go website](/images/go-website.png)

Select the version for your operating system and download it.

![Go versions](/images/go-versions.png)

On Windows, run the installer and follow the prompts—make sure to add Go to your PATH. On Mac, open the .pkg file and install. For Linux, extract the archive with ''tar -xvf'' and add it to your PATH.

Verify the installation by opening a terminal and typing ''go version''. You should see the installed version of Go

![Go installed version](/images/go-installed-version.png)

Open up vs code after that we gonna install the go extension. Search for go & install the extension from the Golang team.

![Go extension vs code](/images/go-extension.png)

## Conclusion

We''ve reached the end of our tutorial on Getting started with Go. Feel free t Thank you for joining me today. Don''t forget to subscribe for more tutorials like this. In the next video you will learn how to write you first go program
', 'Go, also known as Golang, is an open-source programming language developed by Google. Known for its efficiency and backed by a robust community, Go has become a popular choice for developers worldwide, leading to many job opportunities.

### Key Features and Benefits of Learning Go:

**Static Typing:** Go uses static typing. This means it checks your code for errors before it runs, helping prevent problems when your program is actually used. It catches many mistakes early, making your programs safer.

**Simple Syntax:** Go''s syntax is very simple and clear. It''s easy to learn and doesn''t confuse programmers. This helps you spend more time making your applications instead of trying to understand complex code.

**Single Binary Compilation:** When you compile a Go program, it becomes a single file that can run on its own. You don’t need other software to run it. This simplifies deployment.

**Concurrency Support:** Go supports concurrency naturally with features like goroutines and channels. These help your programs do many things at the same time efficiently, making them faster and more responsive without making the code complex.

**Comprehensive Standard Library:** Go has a large standard library that covers many common programming tasks. This library reduces your need for external packages, makes development faster, and helps you build applications more quickly.

**High Performance:** Go is as fast as languages like C or C++. It compiles directly to machine code, making efficient use of system resources. This is very important for applications that need to be fast and reliable.

### Why Learn Go?

Learning Go can significantly advance your programming skills and career prospects. Its growing use in backend development, cloud services, and system programming means that proficiency in Go is highly valued in the tech industry. Moreover, its design philosophy of simplicity and efficiency makes it an excellent choice for both beginners and experienced programmers looking to enhance their toolkit.

## Installing go

Visit [go.dev](https://go.dev/) click on the download button.

![Go website](/images/go-website.png)

Select the version for your operating system and download it.

![Go versions](/images/go-versions.png)

On Windows, run the installer and follow the prompts—make sure to add Go to your PATH. On Mac, open the .pkg file and install. For Linux, extract the archive with ''tar -xvf'' and add it to your PATH.

Verify the installation by opening a terminal and typing ''go version''. You should see the installed version of Go

![Go installed version](/images/go-installed-version.png)

Open up vs code after that we gonna install the go extension. Search for go & install the extension from the Golang team.

![Go extension vs code](/images/go-extension.png)

## Conclusion

We''ve reached the end of our tutorial on Getting started with Go. Feel free t Thank you for joining me today. Don''t forget to subscribe for more tutorials like this. In the next video you will learn how to write you first go program
', NULL, NULL, '1', 'Ready to get started?', 'Get instant access to all content and downloads', 'Buy Now', '1', '0', '0', '0', '0', '1719025200000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '1760538378476', '1763816361402'),
('cmgs4yfe50004y40ywzq64jar', 'go-gin-event-rest-api-guide-source-code', 'Build Production-Ready REST APIs in Go', 'Build a complete REST API for an event management app in Go using Gin and SQL! This tutorial walks you through setting up the project, creating database migrations and models, adding routes and handlers, writing SQL queries, and implementing user registration, JWT authentication, and authorization. You’ll also test everything with Curl and add Swagger documentation.', '0', 'NONE', 'ERZadn9artM', '/images/GIN REST API.png', NULL, NULL, NULL, 'In this tutorial, we will build a REST API in Go using the Gin framework. We will create a simple event app where users can sign up, log in, create events, delete events, edit events and attend events. We will use JWT authentication, authorization to protect routes, middleware, SQL, migrations, and Swagger documentation.

## Table of contents

## Setting up the project

1. **Enable live reload**:

   install air

   https://github.com/air-verse/air

   If you are using zsh, you can add the following to your `.zshrc` file:

   ```bash
   export PATH=$PATH:$HOME/go/bin
   ```

   Create a `.air.toml` file in the root of the project. With the following content:

   ```toml
   root = "."
   testdata_dir = "testdata"
   tmp_dir = "tmp"
   [build]
   args_bin = []
   bin = "./tmp/main"
   cmd = "go build -o ./tmp/main ./cmd/api"
   delay = 1000
   exclude_dir = ["assets", "tmp", "vendor", "testdata"]
   exclude_file = []
   exclude_regex = ["_test.go"]
   exclude_unchanged = false
   follow_symlink = false
   full_bin = ""
   include_dir = []
   include_ext = ["go", "tpl", "tmpl", "html"]
   include_file = []
   kill_delay = "0s"
   log = "build-errors.log"
   poll = false
   poll_interval = 0
   post_cmd = []
   pre_cmd = []
   rerun = false
   rerun_delay = 500
   send_interrupt = false
   stop_on_error = false

   [color]
   app = ""
   build = "yellow"
   main = "magenta"
   runner = "green"
   watcher = "cyan"

   [log]
   main_only = false
   silent = false
   time = false

   [misc]
   clean_on_exit = false

   [proxy]
   app_port = 0
   enabled = false
   proxy_port = 0

   [screen]
   clear_on_rebuild = false
   keep_scroll = true

   ```

we will now be able to live reload the application with `air`.

2. **Initialize a new Go module**:

```bash
go mod init rest-api-in-gin
```

3. **Project Structure Setup**:
   - Create a `cmd` directory at the root of your project. Inside `cmd`, add an `api` directory and place a `main.go` file within it.
   - At the root level, create an `internal` directory. Within `internal`, add a `database` directory.
   - Within the `internal` directory, create a `env` directory.
   - Within the `cmd` directory, create a `migrate` directory. Inside `migrate`, add a `main.go` file and a `migrations` directory.

Your project structure should look like this:

```bash
rest-api-in-gin
├── cmd
│   ├── api
│   │   ├── main.go
│   ├── migrate
│   │   ├── main.go
│   │   └── migrations
├── internal
│   ├── database
│   ├── env
```

## Database Tables Overview

Here is an overview of the tables we will be creating:

### Users Table

| Column       | Description                                                        |
| ------------ | ------------------------------------------------------------------ |
| **id**       | Primary key, auto-incremented, unique identifier for each user.    |
| **email**    | Unique and required, email address of the user.                    |
| **name**     | Required, the full name of the user.                               |
| **password** | Required, should be stored securely, used for user authentication. |

### Events Table

| Column          | Description                                                      |
| --------------- | ---------------------------------------------------------------- |
| **id**          | Primary key, auto-incremented, unique identifier for each event. |
| **owner_id**    | Foreign key referencing `users`, links an event to a user.       |
| **name**        | Required, the name of the event.                                 |
| **description** | Required, a brief description of the event.                      |
| **date**        | Required, the date when the event is scheduled to occur.         |
| **location**    | Required, the venue or place where the event will take place.    |

### Attendees Table

| Column       | Description                                                                |
| ------------ | -------------------------------------------------------------------------- |
| **id**       | Primary key, auto-incremented, unique identifier for each attendee record. |
| **user_id**  | Foreign key referencing `users`, links an attendee to a user.              |
| **event_id** | Foreign key referencing `events`, links an attendee to an event.           |

The `attendees` table links users to events, ensuring that each user and event exists. If a user or event is deleted, related attendee records are also removed automatically.

## Migrations

This project uses golang-migrate for database migrations. First, install the migrate CLI:

Golang migrate https://github.com/golang-migrate/migrate/blob/master/cmd/migrate/README.md

Add the following code to the `cmd/migrate/main.go` file:

```go
package main

import (
	"database/sql"
	"log"
	"os"

	"github.com/golang-migrate/migrate/v4"
	"github.com/golang-migrate/migrate/v4/database/sqlite3"
	"github.com/golang-migrate/migrate/v4/source/file"
)

func main() {
	if len(os.Args) < 2 {
		log.Fatal("Please provide a migration direction: ''up'' or ''down''")
	}

	direction := os.Args[1]

	db, err := sql.Open("sqlite3", "./data.db")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	instance, err := sqlite3.WithInstance(db, &sqlite3.Config{})
	if err != nil {
		log.Fatal(err)
	}

	fSrc, err := (&file.File{}).Open("cmd/migrate/migrations")
	if err != nil {
		log.Fatal(err)
	}

	m, err := migrate.NewWithInstance("file", fSrc, "sqlite3", instance)
	if err != nil {
		log.Fatal(err)
	}

	switch direction {
	case "up":
		if err := m.Up(); err != nil && err != migrate.ErrNoChange {
			log.Fatal(err)
		}
	case "down":
		if err := m.Down(); err != nil && err != migrate.ErrNoChange {
			log.Fatal(err)
		}
	default:
		log.Fatal("Invalid direction. Use ''up'' or ''down''.")
	}
}
```

Here is a breakdown of the migration code:

- We Check for a migration direction (`up` or `down`) from command-line arguments.
- Connect to the SQLite database (`data.db`).
- Create a migration instance using the database connection and migration files.
- If the direction is "up," apply all pending migrations to update the schema.
- If the direction is "down," roll back the most recent migration.
- Log errors for invalid directions or failed migration operations, ignoring `ErrNoChange`.

Lets create our migrations by running the following commands:

```bash
migrate create -ext sql -dir ./cmd/migrate/migrations -seq create_users_table
migrate create -ext sql -dir ./cmd/migrate/migrations -seq create_events_table
migrate create -ext sql -dir ./cmd/migrate/migrations -seq create_attendees_table
```

This will create 6 files in the `cmd/migrate/migrations` folder. one up and one down for each migration.

Open up the `000001_create_users_table.up.sql` file and add the following code to the file:

```sql
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    password TEXT NOT NULL
);
```

Next open up the `000002_create_events_table.up.sql` file and add the following code to the file:

```sql
CREATE TABLE IF NOT EXISTS events (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    owner_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    date DATETIME NOT NULL,
    location TEXT NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES users (id) ON DELETE CASCADE
);
```

An event has an owner id that references the user id, this will be used to restrict the events that a user can delete and update. If a user is deleted, all events created by that user will also be deleted.

The last migration file is the `000003_create_attendees_table.up.sql` file. Open it up and add the following code to the file:

```sql
CREATE TABLE IF NOT EXISTS attendees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    event_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    FOREIGN KEY (event_id) REFERENCES events (id) ON DELETE CASCADE
);
```

The `attendees` table links users to events, ensuring that each user and event exists. If a user or event is deleted, related attendee records are also removed automatically.

To every down file we need to add the following code:

```sql
-- 000001_create_users_table.down.sql
DROP TABLE IF EXISTS users;
```

```sql
-- 000002_create_events_table.down.sql
DROP TABLE IF EXISTS events;
```

```sql
-- 000003_create_attendees_table.down.sql
DROP TABLE IF EXISTS attendees;
```

We can now run the migrations by running the following command:

```bash
go run ./cmd/migrate/main.go up
```

This should now created a `data.db` file in the root of the project. We can view the database in a GUI like TablePlus. It would look something like this:

![Go Gin API TablePlus](@assets/images/go-gin-api-tableplus.png)

## Connecting our api app to the database

Open up the `main.go` file in the `cmd/api` folder and add the following code to the file:

```go
package main

import (
	"database/sql"
	"log"

	_ "github.com/mattn/go-sqlite3"
)

func main() {
	db, err := sql.Open("sqlite3", "./data.db")
	if err != nil {
		log.Fatal(err)
	}

	defer db.Close()
}
```

We open a connection to the database and check for errors.

We then use the `defer` keyword to close the database connection when the main function exits.

## Models

We will be creating 3 models:

1. `User`
2. `Event`
3. `Attendee`

Start by creating a `models.go` file in the `internal/database` folder.

With the following code:

```go
package database

import "database/sql"

type Models struct {
	Users     UserModel
	Events    EventModel
	Attendees AttendeeModel
}

func NewModels(db *sql.DB) Models {
	return Models{
		Users:     UserModel{DB: db},
		Events:    EventModel{DB: db},
		Attendees: AttendeeModel{DB: db},
	}
}
```

Here we are creating a `Models` struct with 3 fields: `Users`, `Events`, and `Attendees`.

We are also creating a `NewModels` function that takes a `*sql.DB` instance as an argument and passes it to the `UserModel`, `EventModel`, and `AttendeeModel` structs.

Next we will create the `UserModel` struct. Create a `users.go` file in the `internal/database` folder.

```go
package database

import "database/sql"

type UserModel struct {
	DB *sql.DB
}

type User struct {
	Id       int    `json:"id"`
	Email    string `json:"email"`
	Name     string `json:"name"`
	Password string `json:"-"`
}
```

- The `UserModel` struct contains a `DB` field, which is a pointer to a `sql.DB` instance.

- The `User` struct includes four fields: `Id`, `Email`, `Password`, and `Name`.

- `json` tags are used to define how the struct fields are converted to and from JSON, ensuring proper data serialization and deserialization.

- The `Password` field is marked with a `-` in the `json` tag, instructing the JSON package to exclude it from JSON responses, making sure we don''t expose the password in the response.

The next model we will create is the `EventModel` struct. Create a `events.go` file in the `internal/database` folder.

```go
package database

import "database/sql"

type EventModel struct {
	DB *sql.DB
}

type Event struct {
	Id          int    `json:"id"`
	OwnerId     int    `json:"ownerId" binding:"required"`
	Name        string `json:"name" binding:"required,min=3"`
	Description string `json:"description" binding:"required,min=10"`
	Date        string `json:"date" binding:"required,datetime=2006-01-02"`
	Location    string `json:"location" binding:"required,min=3"`
}
```

- The `Event` struct includes five fields: `Id`, `OwnerId`, `Name`, `Description`, `Date`, and `Location`.

- We set binding tags and some validation rules. These will used later when creating an event and binding the request body to the `Event` struct. This is done by the Gin framework.

- For now set a binding tag on the `OwnerId` field. Later we will remove it and instead use the current logged in user.

After that we will create the `AttendeeModel` struct. Create a `attendees.go` file in the `internal/database` folder.

```go
package database

import "database/sql"

type AttendeeModel struct {
	DB *sql.DB
}

type Attendee struct {
	Id       int    `json:"id"`
	UserId   int    `json:"userId"`
	EventId  int    `json:"eventId"`
}
```

- The `Attendee` struct includes three fields: `Id`, `UserId`, and `EventId`.

- An attendee is a user that has signed up for an event. An event can have many attendees and an attendee can attend many events.

## Setting Up the Gin Server

1. Create a `routes.go` file in the `cmd/api` folder.

   This file will define the routes for your Gin server.

   ```go
   package main

   import (
   	   "net/http"
       "github.com/gin-gonic/gin"
   )

   func (app *application) routes() http.Handler {
       g := gin.Default()
       return g
   }
   ```

   We create a function `routes` that initializes a new Gin server instance using `gin.Default()`, which sets up some default middleware (like logging and recovery). Currently, it just returns the Gin instance. We will add some routes to this instance later.

2. Create a `server.go` file in the `cmd/api` folder.

   This file will handle starting the HTTP server.

   ```go
   package main

   import (
       "fmt"
       "log"
       "net/http"
       "time"
   )

   func serve(app *application) error {
   	server := &http.Server{
   		Addr:         fmt.Sprintf(":%d", app.port),
   		Handler:      app.routes(),
   		IdleTimeout:  time.Minute,
   		ReadTimeout:  10 * time.Second,
   		WriteTimeout: 30 * time.Second,
   	}

   	log.Printf("Starting server on port %d", app.port)

   	return server.ListenAndServe()
   }
   ```

   The `serve` function sets up an HTTP server with specific configurations like address, handler, and timeouts. It uses the `routes` function to get the handler (Gin instance) for the server. The server is started with `ListenAndServe`, if there is an error it will log the error and exit the program.

3. Create a `env.go` file in the `internal/env` folder.

   Add the following code to the `env.go` file:

   ```go
   package env

   import (
       "os"
       "strconv"
   )

   func GetEnvString(key, defaultValue string) string {
       if value, exists := os.LookupEnv(key); exists {
           return value
       }
       return defaultValue
   }

   func GetEnvInt(key string, defaultValue int) int {
       if value, exists := os.LookupEnv(key); exists {
           if intValue, err := strconv.Atoi(value); err == nil {
               return intValue
           }
       }
       return defaultValue
   }
   ```

   The `GetEnvString` and `GetEnvInt` functions are used to get the value of an environment variable. If the environment variable is not set, the function returns the default value.

4. Put It All Together in the `main.go` in the `cmd/api` folder:

   ```go
   package main

   import (
       "database/sql"
       "log"
       "rest-api-in-gin/internal/database"
       "rest-api-in-gin/internal/env"
       – "github.com/mattn/go-sqlite3"
       _ "github.com/joho/godotenv/autoload" // Automatically loads environment variables
   )

   type application struct {
       port   int
       jwtSecret string
       models database.Models
   }

   func main() {

       db, err := sql.Open("sqlite3", "./data.db")
       if err != nil {
           log.Fatal(err)
       }
       defer db.Close()

       models := database.NewModels(db)

       app := &application{
           port: env.GetEnvInt("PORT", 8080),
           jwtSecret: env.GetEnvString("JWT_SECRET", "some-secret-1213123"),
           models: models,
       }

       if err := serve(app); err != nil {
           log.Fatal(err)
       }
   }
   ```

   Here we load environment variables, initialize the database connection, create an `application` struct and start the server using the `serve` function.

   The application struct will be used to pass the dependencies around without having global variables.

   We then start the server using the `serve` function.

Now we can start the server by running the following command:

```bash
air
```

You should see the following output:

```bash
Starting server on port 8080
```

This means that the server is running and listening for incoming requests on port 8080.

## CRUD for Events

Currently we have no routes so let''s add some.

1. **Set Up Event Routes:**

   Add routes to handle HTTP requests for event operations in your `routes.go` file.

   ```go
   func (app *application) routes() http.Handler {
       g := gin.Default()
       v1 := g.Group("/api/v1")
       {
           v1.POST("/events", app.createEvent)
           v1.GET("/events", app.getAllEvents)
           v1.GET("/events/:id", app.getEvent)
           v1.PUT("/events/:id", app.updateEvent)
           v1.DELETE("/events/:id", app.deleteEvent)
       }

       return g
   }
   ```

   We define a route group `/api/v1` to version our API. Within this group, we map HTTP methods and paths to the corresponding handler functions for event operations. This structure helps organize routes and makes it easier to manage API versions.

2. **Implement Event Handlers:**

   Create a `events.go` file in the `cmd/api` folder and add the following methods.

   **Create Event**

   ```go
   package main

   import (
   	"net/http"
   	"rest-api-in-gin/internal/database"
   	"strconv"

   	"github.com/gin-gonic/gin"
   )

   func (app *application) createEvent(c *gin.Context) {
   	var event database.Event
   	if err := c.ShouldBindJSON(&event); err != nil {
   		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
   		return
   	}
   	err := app.models.Events.Insert(&event)
   	if err != nil {
   		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to create event"})
   		return
   	}
   	c.JSON(http.StatusCreated, event)
   }
   ```

   This handler manages the creation of a new event. It binds the incoming JSON request body to an `Event` struct, validates the data, and calls the `Insert` method on the `EventModel` to add the event to the database. If successful, it returns a `201 Created` status with the created event data.

   **Get All Events**

   ```go
   func (app *application) getAllEvents(c *gin.Context) {
       events, err := app.models.Events.GetAll()
       if err != nil {
           c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retrieve events"})
           return
       }
       c.JSON(http.StatusOK, events)
   }
   ```

   This handler retrieves all events. It calls the `GetAll` method on the `EventModel` to fetch all events from the database. If successful, it returns a `200 OK` status with the list of events.

   **Get Event**

   ```go
   func (app *application) getEvent(c *gin.Context) {
   	id, err := strconv.Atoi(c.Param("id"))
   	if err != nil {
   		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid event ID"})
   		return
   	}
   	event, err := app.models.Events.Get(id)

   	if event == nil {
   		c.JSON(http.StatusNotFound, gin.H{"error": "Event not found"})
   		return
   	}

   	if err != nil {
   		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retrieve event"})
   		return
   	}
   	c.JSON(http.StatusOK, event)
   }
   ```

   This handler retrieves a specific event by its ID. It extracts the event ID from the URL parameters, validates it, and calls the `Get` method on the `EventModel` to fetch the event from the database. If the event is found, it returns a `200 OK` status with the event data else it returns a `404 Not Found` status.

   **Update Event**

   ```go
   func (app *application) updateEvent(c *gin.Context) {
   	id, err := strconv.Atoi(c.Param("id"))
   	if err != nil {
   		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid event ID"})
   		return
   	}

   	existingEvent, err := app.models.Events.Get(id)

   	if err != nil {
   		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retrieve event"})
   		return
   	}

   	if existingEvent == nil {
   		c.JSON(http.StatusNotFound, gin.H{"error": "Event not found"})
   		return
   	}

   	updateEvent := &database.Event{}

   	if err := c.ShouldBindJSON(&updateEvent); err != nil {
   		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
   		return
   	}

   	updateEvent.Id = id

   	if err := app.models.Events.Update(updateEvent); err != nil {
   		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to update event"})
   		return
   	}

   	c.JSON(http.StatusOK, updateEvent)
   }
   ```

   This handler updates an existing event. It extracts and validates the event ID from the URL parameters, checks if the event exists, binds the incoming JSON request body to an `Event` struct, and calls the `Update` method on the `EventModel` to update the event in the database. If successful, it returns a `200 OK` status with the updated event data.

   **Delete Event**

   ```go
   func (app *application) deleteEvent(c *gin.Context) {
       id, err := strconv.Atoi(c.Param("id"))
       if err != nil {
           c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid event ID"})
           return
       }
       if err := app.models.Events.Delete(id); err != nil {
           c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to delete event"})
           return
       }
       c.JSON(http.StatusNoContent, nil)
   }
   ```

   This handler deletes a specific event by its ID. It extracts and validates the event ID from the URL parameters and calls the `Delete` method on the `EventModel` to remove the event from the database. If successful, it returns a `204 No Content` status.

3. **Implement Event Model Methods:**

   Define the methods for the `EventModel` to interact with the database. Open up the `events.go` file in the `database` folder. Update the imports and below the `Event` struct add the following methods.

   **Update imports**

   ```go
   package database

   import (
       "database/sql"
       "context"
       "time"
   )
   ```

   **Insert Method**

   ```go
   func (m EventModel) Insert(event *Event) error {
   	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
   	defer cancel()

   	query := "INSERT INTO events (owner_id, name, description, date, location) VALUES ($1, $2, $3, $4, $5) RETURNING id"

   	err := m.DB.QueryRowContext(ctx, query, event.OwnerId, event.Name, event.Description, event.Date, event.Location).Scan(&event.Id)
   	if err != nil {
   		return err
   	}

   	return nil
   }
   ```

   This function inserts a new event into the `events` table. It uses `QueryRowContext`, which executes the query with a context that includes a 3-second timeout, ensuring the operation doesn''t hang indefinitely. If there is no error we add the id to the event and return `nil`.

   **GetAll Method**

   ```go
    func (m EventModel) GetAll() ([]*Event, error) {
   	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
   	defer cancel()

   	query := "SELECT * FROM events"

   	rows, err := m.DB.QueryContext(ctx, query)
   	if err != nil {
   		return nil, err
   	}
   	defer rows.Close()

   	events := []*Event{}

   	for rows.Next() {
   		var event Event
   		err := rows.Scan(&event.Id, &event.OwnerId, &event.Name, &event.Description, &event.Date, &event.Location)
   		if err != nil {
   			return nil, err
   		}
   		events = append(events, &event)
   	}

   	if err = rows.Err(); err != nil {
   		return nil, err
   	}

   	return events, nil
   }
   ```

   We retrieve all records from the `events` table. We then iterate over the result set and append each event to the `events` slice. If the query fails, we return an error.

   **Get Method**

   ```go
   func (m EventModel) Get(id int) (*Event, error) {
   	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
   	defer cancel()

   	query := "SELECT * FROM events WHERE id = $1"

   	row := m.DB.QueryRowContext(ctx, query, id)

   	var event Event

   	err := row.Scan(&event.Id, &event.OwnerId, &event.Name, &event.Description, &event.Date, &event.Location)
   	if err != nil {
   		if err == sql.ErrNoRows {
   			return nil, nil
   		}
   		return nil, err
   	}

   	return &event, nil
   }
   ```

   This function retrieves a specific record from the `events` table where the `id` matches the provided value. It maps the result to the `Event` struct fields. We check if the event is not found and return nil if it is not found.

   **Update Method**

   ```go
   func (m EventModel) Update(event *Event) error {
   	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
   	defer cancel()

   	query := "UPDATE events SET name = $1, description = $2, date = $3, location = $4 WHERE id = $5"

   	_, err := m.DB.ExecContext(ctx, query, event.Name, event.Description, event.Date, event.Location, event.Id)
   	if err != nil {
   		return err
   	}
   	return nil
   }
   ```

   This function updates an existing record in the `events` table. It uses the `SET` clause to specify the columns to be updated and their new values. It ensures only the record with the specified `id` is updated. If the update fails, it returns an error.

   **Delete Method**

   ```go
   func (m EventModel) Delete(id int) error {
   	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
   	defer cancel()

   	query := "DELETE FROM events WHERE id = $1"

   	_, err := m.DB.ExecContext(ctx, query, id)
   	if err != nil {
   		return err
   	}
   	return nil
   }

   ```

   Removes a record from the `events` table where the `id` matches the provided value. Returns an error if the deletion fails.

   You now have a complete CRUD functionality for events. Let''s test it.

## Creating a User

To be able to connect events with attendees and have events have an owner we need to create a user.

Start adding a new route to the `routes.go` file.

```go
func (app *application) routes() http.Handler {
      ... rest of the routes
      v1.POST("/auth/register", app.registerUser)
}
```

We will group the routes under `/auth` and use the `POST` `register` method to register a new user, later we will add a `login` route.

Create a new handlers file called `auth.go` in the `cmd/api` folder and add the following code:

```go
package main

import (
	"net/http"
	"rest-api-in-gin/internal/database"

	"github.com/gin-gonic/gin"
	"golang.org/x/crypto/bcrypt"
)

type registerRequest struct {
	Email    string `json:"email" binding:"required,email"`
	Password string `json:"password" binding:"required,min=8"`
	Name     string `json:"name" binding:"required,min=2"`
}

func (app *application) registerUser(c *gin.Context) {
	var register registerRequest
	if err := c.ShouldBindJSON(&register); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Hash the password
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(register.Password), bcrypt.DefaultCost)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Something went wrong"})
		return
	}
	register.Password = string(hashedPassword)
	user := database.User{
		Email:    register.Email,
		Password: register.Password,
		Name:     register.Name,
	}
	err = app.models.Users.Insert(&user)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusCreated, user)
}

```

### Explanation of the `registerUserHandler` Method

The `registerUserHandler` function is responsible for handling user registration requests. Here''s a breakdown of its functionality:

1. **Data Binding and Validation**: The function begins by binding the incoming JSON request body to a `registerRequest` struct. This ensures that the data is properly formatted and meets the required criteria, such as a valid email format and minimum password length.

2. **Password Hashing**: To enhance security, the user''s password is hashed using the `bcrypt` library. This step is crucial as it ensures that the password is not stored in plain text in the database.

3. **User Creation**: A new `User` instance is created with the provided email, hashed password, and name. This instance is then inserted into the database.

4. **Response Handling**: If the user is successfully created, the function responds with a `201 Created` status and the user data. If any errors occur during the process, appropriate error messages are returned to the client.

Open `user.go` in the `database` package and update the imports and add the insert method to the `UserModel` struct.

```go
import (
	"context"
	"database/sql"
	"time"
)
```

```go
func (m *UserModel) Insert(user *User) error {
	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()

	stmt := `INSERT INTO users (email, password, name) VALUES ($1, $2, $3) RETURNING id`
	err := m.DB.QueryRowContext(ctx, stmt, user.Email, user.Password, user.Name).Scan(&user.Id)
	if err != nil {
		return err
	}
	return nil
}
```

Here we insert the user into the database and return an error if there is one.

## Testing Events and Users with Curl

We will use [Curl](https://curl.se/) a command line tool to test http requests.

Here are [all curl commands](https://raw.githubusercontent.com/patni1992/Rest-api-in-go-gin/refs/heads/main/curl.txt) that you can paste into your terminal. To test the events.

Let''s start by creating a new user.

```bash
curl -X POST http://localhost:8080/api/v1/auth/register \
-H "Content-Type: application/json" \
-d ''{
  "email": "test@example.com",
  "password": "password",
  "name": "Test User"
}''
```

After you have created a user you can create an event.

```bash
curl -X POST http://localhost:8080/api/v1/events \
-H "Content-Type: application/json" \
-d ''{
  "name": "Go Conference",
  "ownerId": 1,
  "description": "A conference about Go programming",
  "date": "2025-05-20",
  "location": "San Francisco"
}'' \
-w "\nHTTP Status: %{http_code}\n"
```

If everything went well you should see the following output:

```json
{
  "id": 1,
  "ownerId": 1,
  "name": "Go Conference",
  "description": "A conference about Go programming",
  "date": "2025-05-20",
  "location": "San Francisco"
}
HTTP Status: 201 Created
```

We can also retrieve all events.

```bash
curl -X GET http://localhost:8080/api/v1/events \
-H "Content-Type: application/json" \
-w "\nHTTP Status: %{http_code}\n"
```

To retrieve a specific event we can use the following command:

```bash
curl -X GET http://localhost:8080/api/v1/events/1 \
-H "Content-Type: application/json" \
-w "\nHTTP Status: %{http_code}\n"
```

Lets update the event.

```bash
curl -X PUT http://localhost:8080/api/v1/events/1 \
-H "Content-Type: application/json" \
-d ''{
  "name": "Go Conference",
  "ownerId": 1,
  "description": "A conference about Go programming",
  "date": "2025-05-20",
  "location": "New York"
}'' \
-w "\nHTTP Status: %{http_code}\n"
```

If you try to retrieve the event again you should see that the location has been updated.

The last thing we can do is delete the event.

```bash
curl -X DELETE http://localhost:8080/api/v1/events/1 \
-H "Content-Type: application/json" \
-w "\nHTTP Status: %{http_code}\n"
```

If you try to retrieve the event again you should get back a 404 not found error.

## Connecting Events with Attendees

We want users to be able to attend events.

1. **Set Up Attendee Routes:**

   Add routes to handle HTTP requests for attendee operations in your `routes.go` file.

   ```go
   func (app *application) routes() http.Handler {
       g := gin.Default()
       v1 := g.Group("/api/v1")
       {
           // ... rest of the routes ...
           v1.POST("/events/:id/attendees/:userId", app.addAttendeeToEvent)
           v1.GET("/events/:id/attendees", app.getAttendeesForEvent)
       }

       return g
   }
   ```

2. **Implement Attendee Handlers:**

   Open up `events.go` in the `cmd/api` folder and add the following code:

   ```go
   func (app *application) addAttendeeToEvent(c *gin.Context) {
   	eventId, err := strconv.Atoi(c.Param("id"))
   	if err != nil {
   		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid event ID"})
   		return
   	}

   	userId, err := strconv.Atoi(c.Param("userId"))
   	if err != nil {
   		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid user ID"})
   		return
   	}

   	event, err := app.models.Events.Get(eventId)
   	if err != nil {
   		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retrieve event"})
   		return
   	}
   	if event == nil {
   		c.JSON(http.StatusNotFound, gin.H{"error": "Event not found"})
   		return
   	}

   	userToAdd, err := app.models.Users.Get(userId)
   	if err != nil {
   		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retrieve user"})
   		return
   	}
   	if userToAdd == nil {
   		c.JSON(http.StatusNotFound, gin.H{"error": "User not found"})
   		return
   	}

   	existingAttendee, err := app.models.Attendees.GetByEventAndAttendee(event.Id, userToAdd.Id)
   	if err != nil {
   		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retrieve attendee"})
   		return
   	}
   	if existingAttendee != nil {
   		c.JSON(http.StatusConflict, gin.H{"error": "Attendee already exists"})
   		return
   	}

   	attendee := database.Attendee{
   		EventId: event.Id,
   		UserId:  userToAdd.Id,
   	}

   	_, err = app.models.Attendees.Insert(&attendee)
   	if err != nil {
   		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to add attendee"})
   		return
   	}

   	c.JSON(http.StatusCreated, attendee)
   }
   ```

   - `c.Param("id")` and `c.Param("userId")` are used to extract URL parameters for the event and user IDs, respectively.
   - The function checks if the event and user exist in the database. If not, it returns a `404 Not Found` response.
   - It verifies if the attendee already exists for the event. If so, it returns a `409 Conflict` response.
   - The `Insert` method is called to add the attendee to the database if all checks pass.
   - If any operation fails, appropriate HTTP error responses are returned.

   Add a new handler function to get the attendees for an event.

   ```go
   func (app *application) getAttendeesForEvent(c *gin.Context) {
   	id, err := strconv.Atoi(c.Param("id"))
   	if err != nil {
   		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid event ID"})
   		return
   	}

   	users, err := app.models.Attendees.GetAttendeesByEvent(id)
   	if err != nil {
   		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
   		return
   	}

   	c.JSON(http.StatusOK, users)
   }
   ```

   - The method extracts the event ID from the URL parameters using `c.Param("id")` and converts it to an integer. If the conversion fails, it returns a `400 Bad Request` response indicating an invalid event ID.
   - It calls the `GetAttendeesByEvent` method from the `Attendees` model to fetch a list of users attending the specified event.
   - If an error occurs during data retrieval, a `500 Internal Server Error` response is returned with the error message.
   - If the data retrieval is successful, a `200 OK` response is returned along with the list of attendees.

3. **Implement Attendee Model Methods:**

   Define the methods for the `AttendeeModel` in `attendees.go`.

   **Insert Method**

   Open `attendees.go` in the `database` folder and add the following code:

   Update the imports.

   ```go
   import (
   "context"
   "database/sql"
   "time"
   )
   ```

   Add the insert method to the `AttendeeModel` struct.

   **Insert Method**

   ```go
   package database

   func (m *AttendeeModel) Insert(attendee *Attendee) (*Attendee, error) {
   	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
   	defer cancel()

   	query := `INSERT INTO attendees (event_id, user_id) VALUES ($1, $2) RETURNING id`
   	err := m.DB.QueryRowContext(ctx, query, attendee.EventId, attendee.UserId).Scan(&attendee.Id)

   	if err != nil {
   		return nil, err
   	}

   	return attendee, nil
   }

   ```

   Here we insert the attendee into the database with the provided user ID, event ID and return an error if there is one.

   **GetByEventAndAttendee Method**

   ```go
   func (m *AttendeeModel) GetByEventAndAttendee(eventId, userId int) (*Attendee, error) {
   	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
   	defer cancel()

   	query := `SELECT * FROM attendees WHERE event_id = $1 AND user_id = $2`
   	var attendee Attendee
   	err := m.DB.QueryRowContext(ctx, query, eventId, userId).Scan(&attendee.Id, &attendee.UserId, &attendee.EventId)
   	if err != nil {
   		if err == sql.ErrNoRows {
   			return nil, nil
   		}
   		return nil, err
   	}
   	return &attendee, nil
   }

   ```

   This method retrieves an attendee record from the database based on the provided event ID and user ID.

   **GetAttendeesByEvent Method**

   ```go
   func (m AttendeeModel) GetAttendeesByEvent(eventId int) ([]User, error) {
   	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
   	defer cancel()

   	query := `
        SELECT u.id, u.name, u.email
        FROM users u
        JOIN attendees a ON u.id = a.user_id
        WHERE a.event_id = $1
    `
   	rows, err := m.DB.QueryContext(ctx, query, eventId)
   	if err != nil {
   		return nil, err
   	}
   	defer rows.Close()

   	var users []User
   	for rows.Next() {
   		var user User
   		err := rows.Scan(&user.Id, &user.Name, &user.Email)
   		if err != nil {
   			return nil, err
   		}
   		users = append(users, user)
   	}
   	return users, nil
   }
   ```

   This method retrieves a list of users attending a specific event by joining the `users` and `attendees` tables.

4. **Add get user by id method**

   Add the following method to the `UserModel` struct in `users.go`.

   ```go
   func (m *UserModel) Get(id int) (*User, error) {
   	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
   	defer cancel()

   	query := `SELECT * FROM users WHERE id = $1`

   	var user User
   	err := m.DB.QueryRowContext(ctx, query, id).Scan(&user.Id, &user.Email, &user.Name, &user.Password)
   	if err != nil {
   		if err == sql.ErrNoRows {
   			return nil, nil
   		}
   		return nil, err
   	}
   	return &user, nil
   }
   ```

   This method retrieves a user by their ID from the database.

## Delete Attendee from Event & Get Events for User

We can now add attendess to an event and retrieve the attendees for an event. However it would be nice if we could delete an attendee from an event and retrieve the events for a user.

1.  Routes Addition

    Add the following routes to handle new functionalities in your `routes.go` file.

    ```go
    v1.DELETE("/events/:id/attendees/:userId", app.deleteAttendeeFromEvent)
    v1.GET("/attendees/:id/events", app.getEventsByAttendee)
    ```

2.  Handler Functions

    Implement the following handler functions in the `events.go` in the `cmd/api` folder.

    **Remove Attendee from Event:**

    ```go
        func (app *application) deleteAttendeeFromEvent(c *gin.Context) {
        id, err := strconv.Atoi(c.Param("id"))
        if err != nil {
        	c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid event ID"})
        	return
        }

        userId, err := strconv.Atoi(c.Param("userId"))
        if err != nil {
        	c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid user ID"})
        	return
        }

        err = app.models.Attendees.Delete(userId, id)
        if err != nil {
        	c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to delete attendee"})
        	return
        }

        c.JSON(http.StatusNoContent, nil)

    }
    ```

    - Extracts `id` (attendee ID) and `eventId` from the URL parameters.
    - Validates the IDs and returns a `400 Bad Request` if they are invalid.
    - Calls the `Delete` method on the `AttendeeModel` to remove the attendee.
    - Returns a `204 No Content` status if the operation is successful, indicating that the request was successful but there is no content to send back.

      **Get Events for Attendee:**

      ```go
      func (app *application) getEventsByAttendee(c *gin.Context) {
      	id, err := strconv.Atoi(c.Param("id"))
      	if err != nil {
      		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid attendee ID"})
      		return
      	}

      	events, err := app.models.Events.GetByAttendee(id)
      	if err != nil {
      		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
      		return
      	}
      	c.JSON(http.StatusOK, events)
      }
      ```

      - This function retrieves all events an attendee is attending.
      - It extracts `id` (attendee ID) from the URL parameters.
      - Validates the ID and returns a `400 Bad Request` if it is invalid.
      - Calls the `GetByAttendee` method on the `EventModel` to fetch the events.
      - Returns a `200 OK` status with the list of events if the operation is successful.

3.  Database Methods

    **Delete Method:**

    Open `attendees.go` in the `database` folder and add this method:

    ```go
    func (m *AttendeeModel) Delete(userId, eventId int) error {
    	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
    	defer cancel()

    	query := `DELETE FROM attendees WHERE user_id = $1 AND event_id = $2`
    	_, err := m.DB.ExecContext(ctx, query, userId, eventId)
    	if err != nil {
    		return err
    	}
    	return nil
    }
    ```

    This method deletes an attendee from an event with the provided user ID and event ID.

    **Get Events for Attendee:**

    ```go
    func (m EventModel) GetByAttendee(attendeeId int) ([]Event, error) {
    	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
    	defer cancel()

    	query := `
    		SELECT e.id, e.owner_id, e.name, e.description, e.date, e.location
    		FROM events e
    		JOIN attendees a ON e.id = a.event_id
    		WHERE a.user_id = $1
    	`
    	rows, err := m.DB.QueryContext(ctx, query, attendeeId)
    	if err != nil {
    		return nil, err
    	}
    	defer rows.Close()

    	var events []Event
    	for rows.Next() {
    		var event Event
    		err := rows.Scan(&event.Id, &event.OwnerId, &event.Name, &event.Description, &event.Date, &event.Location)
    		if err != nil {
    			return nil, err
    		}
    		events = append(events, event)
    	}
    	return events, nil
    }
    ```

    This method retrieves all events a user is attending with the provided attendee ID, joining the `events` and `attendees` tables to get the relevant data.

## Testing the API

We created a user before that we can use to test the API.
Lets create a new event.

```bash
curl -X POST http://localhost:8080/api/v1/events -H "Content-Type: application/json" -d ''{"name": "Test Event", "ownerId": 1, "description": "This is a test event", "date": "2025-10-01", "location": "Test Location"}'' -w "\nHTTP Status: %{http_code}\n"
```

We can now add the user to the event. Take the id from the user and the event id. (Your ids may be different check the response from the previous requests)

```bash
curl -X POST http://localhost:8080/api/v1/events/1/attendees/1  -H "Content-Type: application/json" -w "\nHTTP Status: %{http_code}\n"
```

We should now get back an attendee this means the user has been added to the event. If we try the same request again we will get `{"error":"Attendee already exists"}`.

This will add the user to the event.

Lets get all the attendees for the event.

```bash
curl http://localhost:8080/api/v1/events/1/attendees
```

## Adding Authentication

Currently, anyone can create, update, and delete events. It would be nice if we could restrict these operations to only be performed by authenticated users.

1. **Routes Addition**

   Add a new route in `routes.go` to handle the authentication.

   ```go
   v1.POST("/auth/login", app.login)
   ```

2. **Handler Functions**

   Add the following code to `auth.go` in the `cmd/api` folder to handle login.

   **Update Imports**

   ```go
   import (
       "fmt"
       "net/http"
       "rest-api-in-gin/internal/database"
       "time"

       "github.com/gin-gonic/gin"
       "github.com/golang-jwt/jwt"
       "golang.org/x/crypto/bcrypt"
   )
   ```

   **Create Login Request, Response, and Handler**

   ```go
   type loginRequest struct {
       Email    string `json:"email" binding:"required,email"`
       Password string `json:"password" binding:"required,min=8"`
   }

   type loginResponse struct {
       Token string `json:"token"`
   }

   func (app *application) login(c *gin.Context) {

       var auth loginRequest
       if err := c.ShouldBindJSON(&auth); err != nil {
           c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
           return
       }

       existingUser, err := app.models.Users.GetByEmail(auth.Email)
       if err != nil {
           c.JSON(http.StatusNotFound, gin.H{"error": "User not found"})
           return
       }

       err = bcrypt.CompareHashAndPassword([]byte(existingUser.Password), []byte(auth.Password))
       if err != nil {
           c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid password"})
           return
       }

       token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
           "userId": existingUser.Id,
           "exp":    time.Now().Add(time.Hour * 72).Unix(), // Token expires in 72 hours
       })

       tokenString, err := token.SignedString([]byte(app.jwtSecret))
       if err != nil {
           c.JSON(http.StatusInternalServerError, gin.H{"error": "Error generating token"})
           return
       }

       c.JSON(http.StatusOK, loginResponse{Token: tokenString})
   }
   ```

   **Explanation of the Login Function**

   - The function begins by binding the incoming JSON request body to a `loginRequest` struct. This ensures that the data is properly formatted and meets the required criteria, such as a valid email format and a minimum password length of 8 characters.
   - It checks if the user exists in the database by calling the `GetByEmail` method on the `UserModel`. If the user is not found, a `404 Not Found` response is returned.
   - The function uses the `bcrypt` library to compare the provided password with the stored hashed password. If the passwords do not match, a `401 Unauthorized` response is returned.
   - Upon successful authentication, a JWT token is generated using the `jwt` library. The token includes the user''s ID and an expiration time (e.g., 72 hours from the time of issuance).
   - The generated token is returned to the client in a `200 OK` response. This token can then be used by the client to access protected routes.

3. **Database Methods**

   Add `getByEmail` to the `UserModel`. Open `users.go` in the `database` and replace the `Get` method with the following code.

   ```go
   func (m *UserModel) getUser(query string, args ...interface{}) (*User, error) {
       ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
       defer cancel()

       var user User
       err := m.DB.QueryRowContext(ctx, query, args...).Scan(&user.Id, &user.Email, &user.Name, &user.Password)
       if err != nil {
           if err == sql.ErrNoRows {
               return nil, nil
           }
           return nil, err
       }
       return &user, nil
   }

   func (m *UserModel) Get(id int) (*User, error) {
       query := `SELECT * FROM users WHERE id = $1`
       return m.getUser(query, id)
   }

   func (m *UserModel) GetByEmail(email string) (*User, error) {
       query := `SELECT * FROM users WHERE email = $1`
       return m.getUser(query, email)
   }
   ```

   Here we did some refactoring and created a new method called `getUser`, notice the `...interface{}` in the method signature. This allows us to pass in multiple arguments to the method. Then we have the `Get` and `GetByEmail` methods that we can use to get a user by id or email. This refactoring reduces code duplication and centralizes the logic for querying and handling user data.

4. **Middleware**

   We can now add middleware to our API to restrict access to certain routes.

   Add a new file called `middleware.go` in `cmd/api` and add the following code:

   ```go
   package main

   import (
       "net/http"
       "strings"

       "github.com/gin-gonic/gin"
       "github.com/golang-jwt/jwt"
   )

   func (app *application) AuthMiddleware() gin.HandlerFunc {
       return func(c *gin.Context) {
           authHeader := c.GetHeader("Authorization")
           if authHeader == "" {
               c.JSON(http.StatusUnauthorized, gin.H{"error": "Authorization header is required"})
               c.Abort()
               return
           }

           tokenString := strings.TrimPrefix(authHeader, "Bearer ")
           if tokenString == authHeader {
               c.JSON(http.StatusUnauthorized, gin.H{"error": "Bearer token is required"})
               c.Abort()
               return
           }

           token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
               if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
                   return nil, jwt.ErrSignatureInvalid
               }
               return []byte(app.jwtSecret), nil
           })

           if err != nil || !token.Valid {
               c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid token"})
               c.Abort()
               return
           }

           claims, ok := token.Claims.(jwt.MapClaims)
           if !ok {
               c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid token"})
               c.Abort()
               return
           }

           userId := claims["userId"].(float64)

           user, err := app.models.Users.Get(int(userId))
           if err != nil {
               c.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized access"})
               c.Abort()
               return
           }

           c.Set("user", user)

           c.Next()
       }
   }
   ```

   **Explanation of the Middleware**

   - **Retrieve the Authorization Header**: The middleware starts by reading the `Authorization` header from the incoming request. This header should contain the JWT. If the header is missing, the middleware responds with a `401 Unauthorized` status and stops further processing by calling `c.Abort()`.
   - **Extract the Bearer Token**: The JWT is expected to be in the format `Bearer {token}`. The middleware removes the `Bearer ` prefix to extract the actual token. If the token is not in the expected format, it responds with a `401 Unauthorized` status and aborts the request.
   - **Parse and Validate the JWT**: The middleware uses the `jwt.Parse` function to decode and validate the token. It checks that the token''s signing method is HMAC, which is a common method for signing JWTs. The `jwtSecret` is used to verify the token''s signature, ensuring it hasn''t been tampered with.
   - **Handle Invalid Tokens**: If the token is invalid or an error occurs during parsing, the middleware responds with a `401 Unauthorized` status and aborts the request.
   - **Extract User Information**: If the token is valid, the middleware extracts the user ID from the token''s claims and retrieves the corresponding user from the database. The user is then set in the request context using `c.Set("user", user)`. This allows other handlers in the chain to access the authenticated user.
   - **Allow the Request to Proceed**: If the token is valid, the middleware calls `c.Next()`, allowing the request to proceed to the next handler in the chain.

5. **Protect Routes**

   We can now add the middleware to our routes. Start by creating a new group of routes that we want to protect, then add the middleware to the group.

   Your code should now look like this:

   ```go
   package main

   import (
       "net/http"

       "github.com/gin-gonic/gin"
   )

   func (app *application) routes() http.Handler {

       g := gin.Default()
       v1 := g.Group("/api/v1")
       {
           v1.GET("/events", app.getAllEvents)
           v1.GET("/events/:id", app.getEvent)
           v1.GET("/events/:id/attendees", app.getAttendeesForEvent)
           v1.GET("/attendees/:id/events", app.getEventsByAttendee)

           v1.POST("/register", app.registerUser)
           v1.POST("/login", app.login)
       }

       authGroup := v1.Group("/")
       authGroup.Use(app.AuthMiddleware())
       {
           authGroup.POST("/events", app.createEvent)
           authGroup.PUT("/events/:id", app.updateEvent)
           authGroup.DELETE("/events/:id", app.deleteEvent)
           authGroup.POST("/events/:id/attendees/:userId", app.addAttendeeToEvent)
           authGroup.DELETE("/events/:id/attendees/:userId", app.deleteAttendeeFromEvent)
       }

       return g
   }
   ```

6. **Testing the API**

   We can now test the API by trying to create a new event without a valid token.

   ```bash
   curl -X POST http://localhost:8080/api/v1/events -H "Content-Type: application/json" -d ''{"name": "Test Event", "ownerId": 1, "description": "This is a test event", "date": "2025-01-01", "location": "Test Location"}'' -w "\nHTTP Status: %{http_code}\n"
   ```

   This should return a `401 Unauthorized` status. With the message `{"error":"Authorization header is required"}`

   **Login and get a token**

   We can now login and get a token.

   ```bash
   curl -X POST http://localhost:8080/api/v1/login -H "Content-Type: application/json" -d ''{"email": "test@example.com", "password": "password"}'' -w "\nHTTP Status: %{http_code}\n"
   ```

   This will return a token that we can use to authenticate our requests.

   **Use the Token**

   We can now use the token to create a new event. To add the token to the request we need to add it to the `Authorization` header. The format should be `-H "Authorization: Bearer {token}"`.

   ```bash
   curl -X POST http://localhost:8080/api/v1/events -H "Content-Type: application/json" -H "Authorization: Bearer {token}" -d ''{"name": "Test Event", "ownerId": 1, "description": "This is a test event", "date": "2025-01-01", "location": "Test Location"}'' -w "\nHTTP Status: %{http_code}\n"
   ```

   should now succeed and return a `201 Created` status.

## Adding Authorization

Currently a user can delete and update any event. We want to restrict this to only allow the user to do it if they are the owner of the event.

First we need to add a helper function to get the user from the context. Create a new file called `context.go` in `cmd/api` and add the following code:

```go
package main

import (
	"rest-api-in-gin/internal/database"

	"github.com/gin-gonic/gin"
)

func (app *application) GetUserFromContext(c *gin.Context) *database.User {
	contextUser, exists := c.Get("user")
	if !exists {
		return &database.User{}
	}

	user, ok := contextUser.(*database.User)
	if !ok {
		return &database.User{}
	}

	return user
}
```

Here we are getting the user from the context and returning it. If the user is not found we return an empty user.

Let''s start with the handler for updating an event, open up `events.go` in `cmd/api` and replace the `updateEvent` method with the following code.

```go
func (app *application) updateEvent(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid event ID"})
		return
	}

	user := app.GetUserFromContext(c)
	existingEvent, err := app.models.Events.Get(id)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retrieve event"})
		return
	}

	if existingEvent == nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Event not found"})
		return
	}

	if existingEvent.OwnerId != user.Id {
		c.JSON(http.StatusForbidden, gin.H{"error": "You are not authorized to update this event"})
		return
	}

	updateEvent := &database.Event{
		Id: id,
	}

	if err := c.ShouldBindJSON(&updateEvent); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	if err := app.models.Events.Update(updateEvent); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to update event"})
		return
	}

	c.JSON(http.StatusOK, updateEvent)
}
```

We get the user from the context and check if the user is the owner of the event. If they are not we return a `403 Forbidden` status.

Lets do the same for deleting an event, adding an attendee and deleting an attendee from an event.

**Delete Event**

```go
func (app *application) deleteEvent(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid event ID"})
		return
	}

	user := app.GetUserFromContext(c)
	existingEvent, err := app.models.Events.Get(id)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retrieve event"})
		return
	}
	if existingEvent == nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Event not found"})
		return
	}

	if user.Id != existingEvent.OwnerId {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized access"})
		return
	}

	if err := app.models.Events.Delete(id); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to delete event"})
		return
	}

	c.JSON(http.StatusNoContent, nil)
}
```

**Add Attendee to Event**

```go
func (app *application) addAttendeeToEvent(c *gin.Context) {
	eventId, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid event ID"})
		return
	}

	userId, err := strconv.Atoi(c.Param("userId"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid user ID"})
		return
	}

	event, err := app.models.Events.Get(eventId)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retrieve event"})
		return
	}

	if event == nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Event not found"})
		return
	}

	userToAdd, err := app.models.Users.Get(userId)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retrieve user"})
		return
	}

	user := app.GetUserFromContext(c)

	if user.Id != event.OwnerId {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized access"})
		return
	}

	if userToAdd == nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "User not found"})
		return
	}

	existingAttendee, err := app.models.Attendees.GetByEventAndAttendee(event.Id, userToAdd.Id)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retrieve attendee"})
		return
	}
	if existingAttendee != nil {
		c.JSON(http.StatusConflict, gin.H{"error": "Attendee already exists"})
		return
	}

	attendee := database.Attendee{
		EventId: event.Id,
		UserId:  userToAdd.Id,
	}

	_, err = app.models.Attendees.Insert(&attendee)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to add attendee"})
		return
	}

	c.JSON(http.StatusCreated, attendee)
}
```

**Delete Attendee from Event**

```go
func (app *application) deleteAttendeeFromEvent(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid event ID"})
		return
	}

	userId, err := strconv.Atoi(c.Param("userId"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid user ID"})
		return
	}

	event, err := app.models.Events.Get(id)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retrieve event"})
		return
	}

	user := app.GetUserFromContext(c)

	if user.Id != event.OwnerId {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized access"})
		return
	}

	err = app.models.Attendees.Delete(userId, id)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to delete attendee"})
		return
	}
	c.JSON(http.StatusNoContent, nil)
}
```

We can also use the same method when creating an event. To set the owner of the event. Remmeber before we were setting the owner to the user id from the request.

**Create Event**

```go
func (app *application) createEvent(c *gin.Context) {
	var event database.Event
	if err := c.ShouldBindJSON(&event); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	user := app.GetUserFromContext(c)
	event.OwnerId = user.Id

	err := app.models.Events.Insert(&event)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to create event"})
		return
	}

	c.JSON(http.StatusCreated, event)
}
```

We get the user from the context and set the owner of the event to the user id.

We also need to update our event model so binding for the owner id is not required. Open up `events.go` in `internal/database` and remove the `OwnerId` field from the `Event` struct.

The event model should now look like this:

```go
type Event struct {
	Id          int    `json:"id"`
	Name        string `json:"name" binding:"required,min=3"`
	Description string `json:"description" binding:"required,min=10"`
	Date        string `json:"date" binding:"required,datetime=2006-01-02"`
	Location    string `json:"location" binding:"required,min=3"`
	OwnerId     int    `json:"ownerId"`
}
```

## Swagger

Swagger is an API documentation tool that allows you to generate interactive API documentation from your code.

To add Swagger to our API we can use the `gin-swagger` package.

Add the following to your `main.go` file in `cmd/api` import the docs and add the swagger comments.

```go
import (
	"database/sql"
	"log"
	_ "rest-api-in-gin/docs"
	"rest-api-in-gin/internal/database"
	"rest-api-in-gin/internal/env"

	_ "github.com/joho/godotenv/autoload"
	_ "github.com/mattn/go-sqlite3"
)


// @title Go Gin Rest API
// @version 1.0
// @description A rest API in Go using Gin framework.
// @securityDefinitions.apikey BearerAuth
// @in header
// @name Authorization
// @description Enter your bearer token in the format **Bearer &lt;token&gt;**

// Apply the security definition to your endpoints
// @security BearerAuth

type application struct {
	port      int
	jwtSecret string
	models    database.Models
}

// -- rest of the code --

```

Open up `routes.go` and add the following route to serve the swagger.json file.

```go
import (
	"net/http"

	"github.com/gin-gonic/gin"
	swaggerFiles "github.com/swaggo/files"
	ginSwagger "github.com/swaggo/gin-swagger"
)


func (app *application) routes() http.Handler {
	g := gin.Default()
	v1 := g.Group("/api/v1")

    ...rest of the routes...

	g.GET("/swagger/*any", func(c *gin.Context) {
		if c.Request.RequestURI == "/swagger/" {
			c.Redirect(302, "/swagger/index.html")
			return
		}
		ginSwagger.WrapHandler(swaggerFiles.Handler, ginSwagger.URL("http://localhost:8080/swagger/doc.json"))(c)
	})

	return g
}


```

This code snippet sets up a route to serve the Swagger documentation. It also redirects the root `/swagger/` path to the Swagger UI. So it will be available at `http://localhost:8080/swagger/`.

Now we just need to document our handlers.

`events.go` will now look like this:

```go
package main

import (
	"net/http"
	"rest-api-in-gin/internal/database"
	"strconv"

	"github.com/gin-gonic/gin"
	_ "github.com/joho/godotenv/autoload"
	_ "github.com/mattn/go-sqlite3"
)

// GetEvents returns all events
//
//	@Summary		Returns all events
//	@Description	Returns all events
//	@Tags			events
//	@Accept			json
//	@Produce		json
//	@Success		200		{object}	[]database.Event
//	@Router			/api/v1/events [get]
func (app *application) getAllEvents(c *gin.Context) {
	events, err := app.models.Events.GetAll()

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retreive events"})
	}

	c.JSON(http.StatusOK, events)
}

// GetEvent returns a single event
//
//	@Summary		Returns a single event
//	@Description	Returns a single event
//	@Tags			events
//	@Accept			json
//	@Produce		json
//	@Param			id	path		int	true	"Event ID"
//	@Success		200	{object}	database.Event
//	@Router			/api/v1/events/{id} [get]
func (app *application) getEvent(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))

	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid event ID"})
	}

	event, err := app.models.Events.Get(id)

	if event == nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Event not found"})
	}

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retreive event"})
	}

	c.JSON(http.StatusOK, event)
}


// CreateEvent creates a new event
//
//	@Summary		Creates a new event
//	@Description	Creates a new event
//	@Tags			events
//	@Accept			json
//	@Produce		json
//	@Param			event	body		database.Event	true	"Event"
//	@Success		201		{object}	database.Event
//	@Router			/api/v1/events [post]
//	@Security		BearerAuth
func (app *application) createEvent(c *gin.Context) {
	var event database.Event

	if err := c.ShouldBindJSON(&event); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	user := app.GetUserFromContext(c)
	event.OwnerId = user.Id

	err := app.models.Events.Insert(&event)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to create event"})
		return
	}

	c.JSON(http.StatusCreated, event)
}

// UpdateEvent updates an existing event
//
//	@Summary		Updates an existing event
//	@Description	Updates an existing event
//	@Tags			events
//	@Accept			json
//	@Produce		json
//	@Param			id	path		int	true	"Event ID"
//	@Param			event	body		database.Event	true	"Event"
//	@Success		200	{object}	database.Event
//	@Router			/api/v1/events/{id} [put]
//	@Security		BearerAuth
func (app *application) updateEvent(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid event ID"})
		return
	}

	user := app.GetUserFromContext(c)
	existingEvent, err := app.models.Events.Get(id)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retreive event"})
		return
	}

	if existingEvent == nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Event not found"})
		return
	}

	if existingEvent.OwnerId != user.Id {
		c.JSON(http.StatusForbidden, gin.H{"error": "You are not authorized to update this event"})
		return
	}

	updatedEvent := &database.Event{}

	if err := c.ShouldBindJSON(updatedEvent); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	updatedEvent.Id = id

	if err := app.models.Events.Update(updatedEvent); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to update event"})
		return
	}

	c.JSON(http.StatusOK, updatedEvent)
}


// DeleteEvent deletes an existing event
//
//	@Summary		Deletes an existing event
//	@Description	Deletes an existing event
//	@Tags			events
//	@Accept			json
//	@Produce		json
//	@Param			id	path		int	true	"Event ID"
//	@Success		204
//	@Router			/api/v1/events/{id} [delete]
//	@Security		BearerAuth
func (app *application) deleteEvent(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"Error": "Invalid event ID"})
	}

	user := app.GetUserFromContext(c)
	existingEvent, err := app.models.Events.Get(id)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"Error": "Failed to retreive event"})
		return
	}

	if existingEvent == nil {
		c.JSON(http.StatusNotFound, gin.H{"Error": "Event not found"})
		return
	}

	if existingEvent.OwnerId != user.Id {
		c.JSON(http.StatusForbidden, gin.H{"error": "You are not authorized to delete this event"})
		return
	}

	if err := app.models.Events.Delete(id); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to delete event"})
	}

	c.JSON(http.StatusNoContent, nil)
}


// GetAttendeesForEvent returns all attendees for a given event
//
//	@Summary		Returns all attendees for a given event
//	@Description	Returns all attendees for a given event
//	@Tags			attendees
//	@Accept			json
//	@Produce		json
//	@Param			id	path		int	true	"Event ID"
//	@Success		200	{object}	[]database.User
//	@Router			/api/v1/events/{id}/attendees [get]
func (app *application) getAttendeesForEvent(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid event id"})
		return
	}

	users, err := app.models.Attendees.GetAttendeesByEvent(id)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to to retreive attendees for events"})
		return
	}

	c.JSON(http.StatusOK, users)
}

// AddAttendeeToEvent adds an attendee to an event
// @Summary		Adds an attendee to an event
// @Description	Adds an attendee to an event
// @Tags			attendees
// @Accept			json
// @Produce		json
// @Param			id	path		int	true	"Event ID"
// @Param			userId	path		int	true	"User ID"
// @Success		201		{object}	database.Attendee
// @Router			/api/v1/events/{id}/attendees/{userId} [post]
// @Security		BearerAuth
func (app *application) addAttendeeToEvent(c *gin.Context) {
	eventId, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid event Id"})
		return
	}

	userId, err := strconv.Atoi(c.Param("userId"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid user Id"})
		return
	}

	event, err := app.models.Events.Get(eventId)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retreive event"})
		return
	}
	if event == nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Event not found"})
	}

	userToAdd, err := app.models.Users.Get(userId)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retreive user"})
		return
	}

	if userToAdd == nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "User not found"})
	}

	user := app.GetUserFromContext(c)

	if event.OwnerId != user.Id {
		c.JSON(http.StatusForbidden, gin.H{"error": "You are not authorized to add an attendee"})
		return
	}

	existingAttendee, err := app.models.Attendees.GetByEventAndAttendee(event.Id, userToAdd.Id)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retreive attendee"})
		return
	}
	if existingAttendee != nil {
		c.JSON(http.StatusConflict, gin.H{"error": "Attendee already exists"})
		return
	}

	attendee := database.Attendee{
		EventId: event.Id,
		UserId:  userToAdd.Id,
	}

	_, err = app.models.Attendees.Insert(&attendee)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to add  attendee"})
		return
	}

	c.JSON(http.StatusCreated, attendee)

}

// GetEventsByAttendee returns all events for a given attendee
//
//	@Summary		Returns all events for a given attendee
//	@Description	Returns all events for a given attendee
//	@Tags			attendees
//	@Accept			json
//	@Produce		json
//	@Param			id	path		int	true	"Attendee ID"
//	@Success		200	{object}	[]database.Event
//	@Router			/api/v1/attendees/{id}/events [get]
func (app *application) getEventsByAttendee(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid attendee id"})
		return
	}
	events, err := app.models.Attendees.GetEventsByAttendee(id)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to get events"})
		return
	}

	c.JSON(http.StatusOK, events)
}

// DeleteAttendeeFromEvent deletes an attendee from an event
// @Summary		Deletes an attendee from an event
// @Description	Deletes an attendee from an event
// @Tags			attendees
// @Accept			json
// @Produce		json
// @Param			id	path		int	true	"Event ID"
// @Param			userId	path		int	true	"User ID"
// @Success		204
// @Router			/api/v1/events/{id}/attendees/{userId} [delete]
// @Security		BearerAuth
func (app *application) deleteAttendeeFromEvent(c *gin.Context) {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid event id"})
		return
	}

	userId, err := strconv.Atoi(c.Param("userId"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid user id"})
		return
	}

	event, err := app.models.Events.Get(id)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Something went wrong"})
		return
	}

	if event == nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Event not found"})
		return
	}

	user := app.GetUserFromContext(c)
	if event.OwnerId != user.Id {
		c.JSON(http.StatusForbidden, gin.H{"error": "You are not authorized to delete an attendeeFromEvent"})
		return
	}

	err = app.models.Attendees.Delete(userId, id)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to delete attendee"})
		return
	}

	c.JSON(http.StatusNoContent, nil)
}
```

The `auth.go` file will now look like this:

```go
package main

import (
	"net/http"
	"rest-api-in-gin/internal/database"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt"
	"golang.org/x/crypto/bcrypt"
)


type loginRequest struct {
	Email    string `json:"email" binding:"required,email"`
	Password string `json:"password" binding:"required,min=8"`
}

type loginResponse struct {
	Token string `json:"token"`
}

type registerRequest struct {
	Email    string `json:"email" binding:"required,email"`
	Password string `json:"password" binding:"required,min=8"`
	Name     string `json:"name" binding:"required,min=2"`
}

// RegisterUser registers a new user
// @Summary		Registers a new user
// @Description	Registers a new user
// @Tags			auth
// @Accept			json
// @Produce		json
// @Param			user	body		registerRequest	true	"User"
// @Success		201	{object}	database.User
// @Router			/api/v1/auth/register [post]
func (app *application) registerUser(c *gin.Context) {
	var register registerRequest

	if err := c.ShouldBindJSON(&register); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(register.Password), bcrypt.DefaultCost)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"Error": "Something went wrong"})
		return
	}

	register.Password = string(hashedPassword)
	user := database.User{
		Email:    register.Email,
		Password: register.Password,
		Name:     register.Name,
	}

	err = app.models.Users.Insert(&user)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Could not create user"})
		return
	}

	c.JSON(http.StatusCreated, user)
}


// Login logs in a user
//
//	@Summary		Logs in a user
//	@Description	Logs in a user
//	@Tags			auth
//	@Accept			json
//	@Produce		json
//	@Param			user	body	loginRequest	true	"User"
//	@Success		200	{object}	loginResponse
//	@Router			/api/v1/auth/login [post]
func (app *application) login(c *gin.Context) {
	var auth loginRequest
	if err := c.ShouldBindJSON(&auth); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	existingUser, err := app.models.Users.GetByEmail(auth.Email)
	if existingUser == nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid email or password"})
		return
	}

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Something went wrong"})
		return
	}

	err = bcrypt.CompareHashAndPassword([]byte(existingUser.Password), []byte(auth.Password))
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid email or password"})
		return
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"userId": existingUser.Id,
		"exp":   time.Now().Add(time.Hour * 72).Unix(),
	})

	tokenString, err := token.SignedString([]byte(app.jwtSecret))
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error generating token"})
		return
	}

	c.JSON(http.StatusOK, loginResponse{Token: tokenString})

}
```

Below are the Swagger tags used in the code and their purposes:

- `@Summary`: A short description of the API endpoint.
- `@Description`: A detailed description of the API endpoint.
- `@Tags`: The category of the API endpoint.
- `@Accept`: The media type the API accepts.
- `@Produce`: The media type the API produces.
- `@Param`: The parameters of the API endpoint.
- `@Success`: The expected response of the API endpoint.
- `@Router`: The HTTP method and path of the API endpoint.
- `@Security`: The security scheme used for the API endpoint.

Run `swag init --dir cmd/api --parseDependency --parseInternal --parseDepth 1` to generate the Swagger documentation.

If you open up localhost:8080/swagger/index.html in your browser, you will see the Swagger UI with all the API endpoints.

![Swagger Overview](@assets/images/go-gin-swagger.png)

### Trying our api with swagger

Go to the login endpoint and click the button `Try it out` Fill in the email and password and click `Execute`.

![Swagger Login](@assets/images/go-swagger-login.png)

You will get a token in the response.

![Swagger Login Response](@assets/images/go-swagger-login-response.png)

Copy the token and scroll upp to The Authorization button and click it.

Write `Bearer` in the `Value` field and paste the token after it and click `Authorize`.

![Swagger Authorization](@assets/images/go-swagger-authorization.png)

You are now logged in and can try any endpoint that requires authorization.

## Conclusion

In this tutorial, we successfully built a REST API in Go using the Gin framework. Our project included event management system that allows for the creation and management of users, events, and attendees. We implemented JWT-based authentication to secure our API, ensuring that only authorized users can perform certain actions.

Additionally, we enhanced our API with Swagger documentation, providing clear and interactive descriptions of our API endpoints.

We organized our code by creating models, handlers, routes, and middleware, each responsible for specific aspects of the application, ensuring a clean and maintainable codebase.

Full source code can be found here [Github](https://github.com/patni1992/Rest-api-in-go-gin)', NULL, NULL, '1', 'Ready to build better REST APIs?', 'Get complete source code and a 50-page guide', 'Buy Now', '1', '0', '0', '1', '0', '1760264280000', 'Build Production-Ready REST APIs in Go - Complete Guide + Source Code', 'Learn to build production-ready REST APIs in Go with this comprehensive package. Includes complete source code for an event management app with JWT authentication, SQL database, and 50-page PDF guide.', 'Go REST API, Golang tutorial, Gin framework, JWT authentication, Go backend, REST API course, Go programming, Event management API, SQL Go, Swagger Go', NULL, NULL, NULL, '0', '1760541505134', '1763817593942'),
('cmiabsx0h0000y4c1i2agyu91', 'react-project-event-app', 'Complete React JS Project - Build an Event App', 'react-project-event-app', '0', 'NONE', '2pUdj2l372w', '/images/React Project – Build a Complete Event App with Auth & REST API Integration.png', NULL, NULL, NULL, 'In this tutorial we will build the frontend for a modern event management app using **React**, **Tailwind CSS**, and **React Router**. We will focus on using the most important features of React that you will need to build a modern web application.

## Table of contents

## 📱 What We''ll Build

By the end of this series, you''ll have a fully functional frontend where users can:

- Register and log in
- View all events
- See what events you are attending
- Create, edit, and delete events
- Manage event attendees

![React Event App landing page](@assets/images/react-event-app-list.png)
![React Event App details page](@assets/images/react-event-app-details.png)

# Project Setup

We will use Vite for this project. If you are not familiar with Vite, it is a build tool that let''s you create modern web applications with ease. It generates a project structure based on the template you choose. Comes with a dev server that automatically reloads the page when you make changes to the code. Gives you a optimized production build when you want to deoploy with a single command.

## ✅ Step 1: Create a Vite Project

We''ll begin by creating a new Vite app we will use the React template with TypeScript. We will also use the SWC compiler for faster build times.

```bash
npm create vite@latest event-app -- --template react-swc-ts
cd event-app
npm install
```

Start the development server to confirm everything is working:

```bash
npm run dev
```

---

If you visit http://localhost:5173 you should see the default Vite page.

![Vite default page](@assets/images/react-vite-starter.png)

## 🎨 Install dependencies

We will use Tailwind CSS for styling and React Router for routing. We will also use clsx for conditional classes and lucide-react for icons.

```bash
npm install tailwindcss @tailwindcss/vite react-router-dom clsx lucide-react
```

The idea is to keep the dependencies to a minimum and focus on core functionality of React.

## 📄 Configure Tailwind CSS

Update your `vite.config.ts` file to enable Tailwind in all relevant files:

```js
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react-swc";
import tailwindcss from "@tailwindcss/vite";

export default defineConfig({
  plugins: [react(), tailwindcss()], // add tailwindcss plugin
});
```

Remove the default styles from `src/index.css` and `src/App.css`.

Now, update your `src/index.css` file to include Tailwind''s base styles:

```css
@import "tailwindcss";
```

Update `app.tsx` remove all the code and add the following:

```tsx
function App() {
  return (
    <h1 className="text-3xl font-bold text-blue-600 underline">Event app</h1>
  );
}

export default App;
```

If you now visit http://localhost:5173 you should see the text "Event app" in blue with additional styling.

## 📁 Set Up Project Structure

To keep things organized, let''s create some new folders in `src/`:

```
src/
├── api/          // API request helpers
├── components/   // Reusable UI components
├── pages/        // Route-based pages (Login, Register, Events)
├── utils/        // Utility functions (e.g., auth, formatting)
├── hooks/        // Custom hooks
├── contexts/     // Contexts for authentication
```

This structure will make it easier to scale and maintain the app as we build more features.

## Changes made to the api

If you been following along with creating the API [Rest API in Gin](/posts/rest-api-in-gin/), I had to do some changes to the API to make it work with the frontend.

React Event App [Source code](https://github.com/patni1992/react-event-app)

- Added userId to login response.
- Updates dates format for event to also include the time.
- Adds endpoints to get all users.
- Enable CORS so the frontend can access the API.

Don''t worry about these API changes if you''re only building the frontend. This tutorial focuses on the frontend part, and we''ll be using the API as our data source.

## Running the API locally

If you have not already, you can run the API locally by following the instructions in the [Rest API in Gin](https://github.com/patni1992/Rest-api-in-go-gin).

To be able to run the API locally, you need to have Go installed. You can download it from [here](https://go.dev/dl/).

1. Clone the repository

```bash
git clone git@github.com:patni1992/Rest-api-in-go-gin.git
```

2. Change directory to the repository

```bash
cd Rest-api-in-go-gin
```

3. Run migrations

```bash
go run ./cmd/migrate up
```

4. Run the API

```bash
go run ./cmd/api
```

it should start running on port 8080.

## Setup React Router

Inside `src/app.tsx` we will setup the React Router. Add the following code:

```tsx
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Navigate,
} from "react-router-dom";
import { EventsPage } from "./pages/EventsPage";
import { MyEventsPage } from "./pages/MyEventsPage";
import { LoginPage } from "./pages/LoginPage";
import { RegisterPage } from "./pages/RegisterPage";
import { EventDetailsPage } from "./pages/EventDetailsPage";
import { EditEventPage } from "./pages/EditEventPage";

function App() {
  return (
    <div className="min-h-screen bg-gray-50">
      <Router>
        <main className="container mx-auto px-4 py-8">
          <Routes>
            <Route path="/" element={<EventsPage />} />
            <Route path="/my-events" element={<MyEventsPage />} />
            <Route path="/events/:eventId" element={<EventDetailsPage />} />
            <Route path="/events/:eventId/edit" element={<EditEventPage />} />
            <Route path="/login" element={<LoginPage />} />
            <Route path="/register" element={<RegisterPage />} />
            <Route path="*" element={<Navigate to="/" replace />} />
          </Routes>
        </main>
      </Router>
    </div>
  );
}

export default App;
```

We create a `BrowserRouter` to wrap the app and the `Routes` to define the routes. The `Route` component is used to define the path and the element to render when the path is matched. So when the user visits for example `/my-events` the `MyEventsPage` component will be rendered. The `Navigate` component is used to redirect to a different path. We use this to redirect to the home page if the user visits a non-existing path.

Let''s create the pages for the routes.

```tsx
// src/pages/EventsPage.tsx
export function EventsPage() {
  return <div>EventsPage</div>;
}

// src/pages/MyEventsPage.tsx
export function MyEventsPage() {
  return <div>MyEventsPage</div>;
}

// src/pages/EventDetailsPage.tsx
export function EventDetailsPage() {
  return <div>EventDetailsPage</div>;
}

// src/pages/EditEventPage.tsx
export function EditEventPage() {
  return <div>EditEventPage</div>;
}

// src/pages/LoginPage.tsx
export function LoginPage() {
  return <div>LoginPage</div>;
}

// src/pages/RegisterPage.tsx
export function RegisterPage() {
  return <div>RegisterPage</div>;
}
```

If you now open the browser and try to navigate to the different pages for example `/events`. You should see the page content.

## 📄 Creating the Header Component

Currently we have no navigation. Let''s create a simple header. Inside `src/components/header/Header.tsx` add the following code:

```tsx
import { Link } from "react-router-dom";

export function Header() {
  return (
    <header className="flex items-center justify-between bg-white p-4 shadow">
      <h1 className="text-xl font-bold">Event App</h1>
      <nav className="flex items-center gap-4">
        <ul className="flex gap-4">
          <li>
            <Link to="/">All Events</Link>
          </li>
          <li>
            <Link to="/my-events">My Events</Link>
          </li>
          <li>
            <Link to="/login">Login</Link>
          </li>
          <li>
            <Link to="/register">Register</Link>
          </li>
        </ul>
      </nav>
    </header>
  );
}
```

Here we are using the `Link` component to navigate to the different pages. The `Link` component from React Router provides client-side navigation without page reloads, unlike regular `<a>` tags.

Let''s update the `App.tsx` file to include the `Header` component.

```tsx
import { Header } from "./components/header/Header";

function App() {
  return (
    <div className="min-h-screen bg-gray-50">
      <Router>
        <Header />
        ... rest of the code
      </Router>
    </div>
  );
}
```

The Header will be rendered in all pages and we can navigate to the different pages by clicking the links in the header.

todo: add image

## 🔐 Authentication with React Context

In this section, we''ll set up authentication for our app using React Context. This will allow us to manage user login and logout.

### What is React Context?

React Context lets you share data between any components in your app without manually passing it through each level. It''s like having a central storage that any component can access directly.

### Setting Up Authentication Context

First, let''s create two files:

1. `src/contexts/AuthContext.tsx` - Defines our context and hook
2. `src/contexts/AuthProvider.tsx` - Provides the authentication state

#### Creating the Context

In `src/contexts/AuthContext.tsx` add the following code:

```tsx
import { createContext, useContext } from "react";
import type { AuthUser } from "../types";

interface AuthContextType {
  auth: AuthUser | null;
  login: (user: AuthUser) => void;
  logout: () => void;
  isAuthenticated: boolean;
}

export const AuthContext = createContext<AuthContextType | null>(null);

export const useAuth = () => {
  const context = useContext(AuthContext);

  if (context === null) {
    throw new Error("useAuth must be used within an AuthProvider");
  }

  return context;
};
```

This code sets up the **foundation** for our authentication system:

1. **Interface** - Defines what authentication data will be available (user info, login/logout functions, auth status)
2. **Context** - Creates an empty "storage container" for our authentication data
3. **Custom Hook** - Provides an easy way for components to access auth data with `useAuth()`

Note: This just creates the structure - the actual values and logic are implemented in the `AuthProvider` component below.

#### Creating the Provider

In `src/contexts/AuthProvider.tsx` add the following code:

```tsx
import { useState } from "react";
import { useEffect } from "react";
import type { AuthUser } from "../types";
import { AuthContext } from "./AuthContext";

interface AuthProviderProps {
  children: React.ReactNode;
}

export const AuthProvider = ({ children }: AuthProviderProps) => {
  const [auth, setAuth] = useState<AuthUser | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const loadAuthUser = () => {
      const savedUser = localStorage.getItem("auth");
      if (savedUser) {
        try {
          setAuth(JSON.parse(savedUser));
        } catch (error) {
          console.error("Error parsing saved user:", error);
          localStorage.removeItem("auth");
        }
      }
      setLoading(false);
    };

    loadAuthUser();
  }, []);

  const login = (userData: AuthUser) => {
    setAuth(userData);
    localStorage.setItem("auth", JSON.stringify(userData));
  };

  const logout = () => {
    setAuth(null);
    localStorage.removeItem("auth");
  };

  if (loading) {
    return null;
  }

  const value = {
    auth,
    login,
    logout,
    isAuthenticated: !!auth,
  };

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
};
```

The `AuthProvider` component is the heart of our authentication system. It manages the user''s authentication state and provides it to all child components. When the app starts, it checks localStorage for any saved user data. It also provides `login` and `logout` functions that update both the state and localStorage. Any component below this provider in the component tree can access the authentication state and these functions using the `useAuth` hook.

We will also create a type for the auth user.

Create a new file:  
`src/types.ts`

```tsx
export interface AuthUser {
  userId: number;
  token: string;
}
```

This is what we will get back from the API when the user logs in.

### Adding auth provider to the app

Inside the `src/App.tsx` file, we need to add the auth provider to the app.

Add the following code:

```tsx
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Navigate,
} from "react-router-dom";
import { EventsPage } from "./pages/EventsPage";
import { MyEventsPage } from "./pages/MyEventsPage";
import { LoginPage } from "./pages/LoginPage";
import { RegisterPage } from "./pages/RegisterPage";
import { AuthProvider } from "./contexts/AuthProvider";
import { EventDetailsPage } from "./pages/EventDetailsPage";
import { EditEventPage } from "./pages/EditEventPage";
import { Header } from "./components/header/Header";

function App() {
  return (
    <AuthProvider>
      <div className="min-h-screen bg-gray-50">
        <Router>
          <Header />
          <main className="container mx-auto px-4 py-8">
            <Routes>
              <Route path="/" element={<EventsPage />} />
              <Route path="/my-events" element={<MyEventsPage />} />
              <Route path="/events/:eventId" element={<EventDetailsPage />} />
              <Route path="/events/:eventId/edit" element={<EditEventPage />} />
              <Route path="/login" element={<LoginPage />} />
              <Route path="/register" element={<RegisterPage />} />
              <Route path="*" element={<Navigate to="/" replace />} />
            </Routes>
          </main>
        </Router>
      </div>
    </AuthProvider>
  );
}

export default App;
```

### Benefits of Using Context for Auth

1. **Global Access**: Any component can access the auth state without prop drilling
2. **Consistent State**: The auth state is managed in one place
3. **Persistence**: User stays logged in even after page refresh
4. **Type Safety**: TypeScript ensures we use the auth functions correctly

## API client

We will use the built in fetch library to make requests to the API. To make it easier to use, we will create a custom wrapper.

Create a new file:  
`src/api/api.ts`

```tsx
export const API_BASE_URL =
  import.meta.env.VITE_API_BASE_URL || "http://localhost:8080/api";

export const apiFetch = async (
  url: string,
  options: RequestInit = {}
): Promise<Response> => {
  const auth = localStorage.getItem("auth");
  const token = auth ? JSON.parse(auth).token : null;

  const defaultHeaders = {
    "Content-Type": "application/json",
    Accept: "application/json",
  };

  const headers = token
    ? {
        ...defaultHeaders,
        Authorization: `Bearer ${token}`,
      }
    : defaultHeaders;

  return window.fetch(url, {
    ...options,
    headers,
  });
};
```

This API client sets up a base URL and wraps the fetch API with authentication handling. It automatically adds JSON headers and, if available, includes the user''s auth token from localStorage.

## Login and Register Pages

Before we start building the login and register pages, we will create some components that we will use in the pages.

### Creating the Button Component

To be consistent with the styling & reduce code duplication, we will create a button component.

Create a new file:  
`src/components/Button.tsx`

```tsx
import clsx from "clsx";

const buttonClasses = {
  base: "rounded-md cursor-pointer disabled:opacity-50",
  variants: {
    primary: "bg-blue-600 hover:bg-blue-700 text-white",
    secondary:
      "border border-gray-300 text-gray-700 hover:bg-gray-50 hover:text-gray-900",
  },
  sizes: {
    default: "px-4 py-2",
    small: "px-3 py-1 text-sm",
  },
};

export function Button({
  children,
  icon,
  variant = "primary",
  size = "default",
  ...props
}: React.ButtonHTMLAttributes<HTMLButtonElement> & {
  icon?: React.ReactNode;
  variant?: "primary" | "secondary";
  size?: "default" | "small";
}) {
  return (
    <button
      className={clsx(
        buttonClasses.base,
        buttonClasses.variants[variant],
        buttonClasses.sizes[size],
        icon && "flex items-center gap-2"
      )}
      {...props}
    >
      {icon}
      {children}
    </button>
  );
}
```

We setup some basic styling for the button. It also comes with different variants and sizes. To keep the classnames clean we use the `clsx` library.

### Creating the InputGroup Component

We will also create a input component that we will used in forms.

Create a new file:  
`src/components/InputGroup.tsx`

```tsx
import type { ChangeEvent } from "react";

interface InputGroupProps {
  name: string;
  label: string;
  value: string;
  onChange: (e: ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => void;
  error?: string;
  type?: string;
  isTextArea?: boolean;
  rows?: number;
  className?: string;
}

export function InputGroup({
  name,
  label,
  value,
  onChange,
  error,
  type = "text",
  isTextArea = false,
  rows = 3,
  className = "",
}: InputGroupProps) {
  const InputType = isTextArea ? "textarea" : "input";

  return (
    <div className={className}>
      <label
        htmlFor={name}
        className="mb-1 block text-sm font-medium text-gray-700"
      >
        {label}
      </label>
      <InputType
        autoComplete="off"
        id={name}
        name={name}
        value={value}
        onChange={onChange}
        rows={isTextArea ? rows : undefined}
        type={isTextArea ? undefined : type}
        className={`w-full rounded-md border px-3 py-2 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500 ${
          error ? "border-red-500" : "border-gray-300"
        }`}
      />
      {error && <p className="mt-1 text-sm text-red-500">{error}</p>}
    </div>
  );
}
```

The purpose of this component is to make sure input fields have consistent styling. We also reduce the amount of code in forms.

### Creating the useForm Hook

To make it easier to manage form state and validation, we will create a custom hook.

Create a new file:  
`src/hooks/useForm.tsx`

Add the following code:

```tsx
import { useState, useEffect } from "react";
import type { ChangeEvent, FormEvent } from "react";

export function useForm<T>({
  initialValues,
  validate,
  onSubmit,
}: {
  initialValues: T;
  validate?: (values: T) => Partial<T>;
  onSubmit: (values: T) => Promise<void> | void;
}) {
  const [values, setValues] = useState<T>(initialValues);
  const [errors, setErrors] = useState<Partial<T>>({});
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<Error | null>(null);

  useEffect(() => {
    setValues(initialValues);
  }, [initialValues]);

  const handleChange = (
    e: ChangeEvent<HTMLInputElement | HTMLTextAreaElement>
  ) => {
    const { name, value } = e.target;
    setValues(prev => ({ ...prev, [name]: value }));
    setErrors(prev => ({ ...prev, [name]: null }));
  };

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault();
    setError(null);

    if (validate) {
      const newErrors = validate(values);
      setErrors(newErrors);

      if (Object.keys(newErrors).length > 0) {
        return;
      }
    }

    setIsLoading(true);
    try {
      await onSubmit(values);
    } catch (err) {
      setError(err instanceof Error ? err : new Error("Something went wrong"));
    } finally {
      setIsLoading(false);
    }
  };

  const reset = () => {
    setValues(initialValues);
    setErrors({});
    setError(null);
  };

  return {
    values,
    errors,
    error,
    isLoading,
    handleChange,
    handleSubmit,
    reset,
  };
}
```

The `useForm` hook is a custom hook that handles all the common form tasks:

- Managing form values
- Handling form submission
- Showing loading states
- Displaying errors
- Form validation

This saves us from writing the same form logic in every form component.

### Creating the ErrorMessage Component

Create a new file:  
`src/components/ErrorMessage.tsx`

```tsx
export function ErrorMessage({ error }: { error: Error | null | string }) {
  if (!error) return null;
  return (
    <div className="mb-4 rounded-md bg-red-50 p-3 text-red-600">
      {error instanceof Error ? error.message : error}
    </div>
  );
}
```

A reusable error component that shows error messages in a consistent style. By keeping it in one place, we can easily update the look and feel of all error messages across the app.

### Creating the LoadingMessage Component

Create a new file:  
`src/components/LoadingMessage.tsx`

Add the following code:

```tsx
export function LoadingMessage({ message }: { message: string }) {
  return (
    <div className="flex justify-center py-10">
      <div className="animate-pulse text-gray-500">{message}</div>
    </div>
  );
}
```

This is a simple component that will be used to show a loading message.

### Register page

We are now ready to build the register page.

Open the file:  
`src/pages/RegisterPage.tsx`

Remove all the code and add the following:

```tsx
import { Link, useNavigate } from "react-router-dom";
import { register } from "../api/auth";
import { Button } from "../components/Button";
import { InputGroup } from "../components/InputGroup";
import { useForm } from "../hooks/useForm";
import { ErrorMessage } from "../components/ErrorMessage";

interface RegisterFormData {
  name: string;
  email: string;
  password: string;
}

const initialValues: RegisterFormData = {
  name: "",
  email: "",
  password: "",
};

export function RegisterPage() {
  const navigate = useNavigate();

  const validateForm = (values: RegisterFormData) => {
    const errors: Partial<RegisterFormData> = {};
    if (!values.name) errors.name = "Name is required";
    if (!values.email) errors.email = "Email is required";
    if (values.password.length < 8)
      errors.password = "Password must be at least 8 characters long";

    return errors;
  };

  const onSubmit = async (values: RegisterFormData) => {
    await register(values.name, values.email, values.password);
    navigate("/login");
  };

  const { values, errors, error, isLoading, handleChange, handleSubmit } =
    useForm<RegisterFormData>({
      initialValues,
      validate: validateForm,
      onSubmit,
    });

  return (
    <div className="mx-auto max-w-md">
      <div className="rounded-lg bg-white p-6 shadow-md">
        <h2 className="mb-6 text-2xl font-semibold text-gray-800">Register</h2>

        {error && <ErrorMessage error={error} />}

        <form className="flex flex-col gap-4" onSubmit={handleSubmit}>
          <InputGroup
            label="Name"
            name="name"
            value={values.name}
            onChange={handleChange}
            error={errors.name}
          />

          <InputGroup
            label="Email"
            name="email"
            type="email"
            value={values.email}
            onChange={handleChange}
            error={errors.email}
          />

          <InputGroup
            label="Password"
            name="password"
            type="password"
            value={values.password}
            onChange={handleChange}
            error={errors.password}
          />

          <div className="flex flex-col space-y-3">
            <Button type="submit" disabled={isLoading}>
              {isLoading ? "Registering..." : "Register"}
            </Button>

            <div className="text-center text-sm text-gray-600">
              Already have an account?{" "}
              <Link to="/login" className="text-blue-600 hover:text-blue-800">
                Login
              </Link>
            </div>
          </div>
        </form>
      </div>
    </div>
  );
}
```

This RegisterPage component creates a user registration form with the following features:

1. **Form Fields**: It includes three input fields:

   - Name field for the user''s full name
   - Email field for the user''s email address
   - Password field for the user''s password

2. **Form Validation**: The form includes validation rules:

   - Name and email are required fields
   - Password must be at least 8 characters long
   - Error messages are displayed below each field if validation fails

3. **Form Handling**:
   - Uses a custom `useForm` hook to manage form state and submission
   - Clicking the register button will call the register function from the api.
   - Automatically redirects to the login page after successful registration

Creating the register api call

Create a new file:  
`src/api/auth.ts`

Add the following code:

```tsx
import type { User } from "../types";
import { API_BASE_URL, apiFetch } from "./api";

export const register = async (
  name: string,
  email: string,
  password: string
): Promise<User | null> => {
  try {
    const response = await apiFetch(`${API_BASE_URL}/v1/auth/register`, {
      method: "POST",
      body: JSON.stringify({ name, email, password }),
    });

    if (!response.ok) {
      return null;
    }

    return await response.json();
  } catch (error) {
    console.error("Registration error:", error);
    return null;
  }
};
```

Here we are making a POST request to the `/v1/auth/register` endpoint. We are sending the name, email, and password in the body of the request.

If the request is successful, we will receive a user object in the response. If the request fails, we will return null.

Now we just need to create a user type.

Inside the `src/types.ts` file, add the following code:

```tsx
export interface User {
  id: number;
  name: string;
  email: string;
}
```

### Login page

Open the file:  
`src/pages/LoginPage.tsx`

Remove all the code and add the following:

```tsx
import { Link, useNavigate, useLocation } from "react-router-dom";
import { login } from "../api/auth";
import { useAuth } from "../contexts/AuthContext";
import { InputGroup } from "../components/InputGroup";
import { useForm } from "../hooks/useForm";
import { Button } from "../components/Button";
import { ErrorMessage } from "../components/ErrorMessage";

type LoginForm = {
  email: string;
  password: string;
};

const initialValues: LoginForm = {
  email: "",
  password: "",
};

export function LoginPage() {
  const { login: authLogin } = useAuth();
  const navigate = useNavigate();
  const location = useLocation();
  const from = location.state?.from?.pathname || "/";

  const validate = (values: LoginForm) => {
    const errors: Partial<LoginForm> = {};
    if (!values.email) errors.email = "Email is required";
    if (!values.password) errors.password = "Password is required";
    return errors;
  };

  const {
    values: formData,
    errors,
    error,
    isLoading,
    handleChange,
    handleSubmit,
  } = useForm<LoginForm>({
    initialValues,
    validate,
    onSubmit: async values => {
      const user = await login(values.email, values.password);
      if (user) {
        authLogin(user);
        navigate(from, { replace: true });
      } else {
        throw new Error("Invalid email or password");
      }
    },
  });

  return (
    <div className="mx-auto max-w-md">
      <div className="rounded-lg bg-white p-6 shadow-md">
        <h2 className="mb-6 text-2xl font-semibold text-gray-800">Login</h2>

        {error && <ErrorMessage error={error} />}

        <form className="flex flex-col gap-6" onSubmit={handleSubmit}>
          <InputGroup
            error={errors.email}
            name="email"
            label="Email"
            value={formData.email}
            onChange={handleChange}
          />

          <InputGroup
            error={errors.password}
            name="password"
            label="Password"
            value={formData.password}
            onChange={handleChange}
            type="password"
          />

          <div className="flex flex-col space-y-3">
            <Button disabled={isLoading}>
              {isLoading ? "Logging in..." : "Login"}
            </Button>

            <div className="text-center text-sm text-gray-600">
              Don''t have an account?{" "}
              <Link
                to="/register"
                className="text-blue-600 hover:text-blue-800"
              >
                Register
              </Link>
            </div>
          </div>
        </form>
      </div>
    </div>
  );
}
```

This LoginPage component creates a user login form with the following features:

1. **Form Fields**: It includes two input fields:

   - Email field for the user''s email address
   - Password field for the user''s password

2. **Form Validation**: The form includes basic validation:

   - Both email and password are required fields
   - Error messages are displayed below each field if validation fails

3. **Authentication Flow**:

   - Uses the `useAuth` hook to manage authentication state
   - Redirects users back to their original destination after successful login
   - Handles failed login attempts with clear error messages
   - Shows loading state during the login process

   Now we need to create the login api call.

Inside this file
`src/api/auth.ts`

Add the following code:

```ts
import type { AuthUser, User } from "../types";
import { API_BASE_URL, apiFetch } from "./api";

export const login = async (
  email: string,
  password: string
): Promise<AuthUser | null> => {
  try {
    const response = await apiFetch(`${API_BASE_URL}/v1/auth/login`, {
      method: "POST",
      body: JSON.stringify({ email, password }),
    });

    if (!response.ok) {
      return null;
    }

    return await response.json();
  } catch (error) {
    console.error("Login error:", error);
    return null;
  }
};
// ... rest of the code
```

Here we are making a POST request to the `/v1/auth/login` endpoint. We are sending the email and password in the body of the request.

If the request is successful, we will receive an auth user object in the response. If the request fails, we will return null.

### Testing registering a new user and logging in

Now we can test the register and login pages.

1. Go to the register page and register a new user, after registering you should be redirected to the login page.
2. Login with the new user.
3. You should be redirected to the events page.
4. If we inspect localStorage we should see the token and userId.

## Protecting routes & logging out

### Protecting routes

For my events page we want to protect the route so only authenticated users can access it. To do this we will create a protected route component.

Create a new file:  
`src/components/ProtectedRoute.tsx`

Add the following code:

```tsx
import { Navigate } from "react-router-dom";
import { useAuth } from "../contexts/AuthContext";

interface ProtectedRouteProps {
  children: React.ReactNode;
}

export function ProtectedRoute({ children }: ProtectedRouteProps) {
  const { isAuthenticated } = useAuth();

  if (!isAuthenticated) {
    return <Navigate to="/login" replace />;
  }

  return <>{children}</>;
}
```

Here we are using the `useAuth` hook to check if the user is authenticated. If the user is not authenticated, we redirect them to the login page else we render the protected route.

Inside the `src/App.tsx` file, we need to add the protected route to the my events page.

Add the following code:

```tsx
import { ProtectedRoute } from "./components/ProtectedRoute";

<Route
  path="/my-events"
  element={
    <ProtectedRoute>
      <MyEventsPage />
    </ProtectedRoute>
  }
/>;
```

### Logging out

If the user is logged in, we want to add a logout button to the header.

Inside the `src/components/header/Header.tsx` file, we need to add a logout button.

Update it to the following:

```tsx
import { Link, useNavigate } from "react-router-dom";
import { useAuth } from "../../contexts/AuthContext";
import { Button } from "../Button";

export function Header() {
  const { isAuthenticated, logout } = useAuth();
  const navigate = useNavigate();

  const handleLogout = () => {
    logout();
    navigate("/");
  };

  return (
    <header className="flex items-center justify-between bg-white p-4 shadow">
      <h1 className="text-xl font-bold">Event App</h1>
      <nav className="flex items-center gap-4">
        <ul className="flex gap-4">
          <li>
            <Link to="/">All Events</Link>
          </li>
          <li>
            <Link to="/my-events">My Events</Link>
          </li>
          {isAuthenticated ? (
            <li>
              <Button variant="secondary" size="small" onClick={handleLogout}>
                Logout
              </Button>
            </li>
          ) : (
            <>
              <li>
                <Link to="/login">Login</Link>
              </li>
              <li>
                <Link to="/register">Register</Link>
              </li>
            </>
          )}
        </ul>
      </nav>
    </header>
  );
}
```

We are using the `useAuth` hook to check if the user is authenticated. If the user is authenticated, we show the logout button. If the user is not authenticated, we show the login and register links.

When the user clicks the logout button, we call the `logout` function and redirect them to the home page using the `useNavigate` hook.

If we now go to the my events page we should see my events page and if we click the logout button and try to access the page again we should be redirected to the login page.

## 📄 Creating the Events Page

### Creating the EventsPage component

When the user visits the events page we want to fetch the events from the API and display them.

Open the file:  
`src/pages/EventsPage.tsx`

Remove all the code and add the following:

```tsx
import { fetchEvents } from "../api/events";
import { EventList } from "../components/events/EventList";
import type { EventData } from "../types";
import { useFetch } from "../hooks/useFetch";

export function EventsPage() {
  const { data, loading, error } = useFetch<EventData[]>(fetchEvents);
  const events = data ?? [];

  return (
    <>
      <div className="mb-6 flex items-center justify-between">
        <h1 className="text-2xl font-semibold text-gray-800">Events</h1>
      </div>

      <EventList
        loading={loading}
        error={error?.message ?? null}
        events={events}
      />
    </>
  );
}
```

We are using the `useFetch` hook to fetch the events from the API, this hook is a custom hook that we will create in the next section. We pass the data to the `EventList` component. This component will also be used in the my events page.

### Createting the useFetch hook & fetchEvents api call

Create a new file:  
`src/hooks/useFetch.tsx`

Add the following code:

```ts
import { useState, useEffect, useCallback } from "react";

type UseFetchResult<T> = {
  data: T | null;
  error: Error | null;
  loading: boolean;
  refetch: () => void;
};

export function useFetch<T>(fetcher: () => Promise<T>): UseFetchResult<T> {
  const [data, setData] = useState<T | null>(null);
  const [error, setError] = useState<Error | null>(null);
  const [loading, setLoading] = useState<boolean>(false);

  const fetchData = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const result = await fetcher();
      setData(result);
    } catch (err) {
      setError(err as Error);
    } finally {
      setLoading(false);
    }
  }, [fetcher]);

  useEffect(() => {
    fetchData();
  }, [fetchData]);

  return { data, error, loading, refetch: fetchData };
}
```

The `useFetch` hook is a custom hook that fetches data from the API and returns the data, error, loading state and a function to refetch the data. The purpose of this hook is to avoid repeating the same code in every page that fetches data from the API.

If you would use a library like react-query, under the hood it would be doing something similar to this.

Now we need to create the `fetchEvents` api call.

Inside the `src/api` folder, create a new file:  
`src/api/events.ts`

With the following code:

```ts
import type { EventData } from "../types";
import { API_BASE_URL, apiFetch } from "./api";

export const fetchEvents = async (): Promise<EventData[]> => {
  try {
    const response = await apiFetch(`${API_BASE_URL}/v1/events`);

    if (!response.ok) {
      throw new Error(`API error: ${response.status}`);
    }

    return await response.json();
  } catch (error) {
    console.error("Error fetching events:", error);
    throw error;
  }
};
```

We are using the helpers we created earlier and then we are making a GET request to the `/v1/events` endpoint.

If the request is successful, we will receive an array of events in the response. If the request fails, we will throw an error.

### Creating the types for the events

Inside the `src/types.ts` file, add the following code:

```tsx
export interface EventData {
  id: number;
  name: string;
  description: string;
  date: string;
  location: string;
  ownerId: number;
}
```

This is the type for the events that we will get back from the API.

If we now go to the events page it should say no events found. This is because we don''t have any events in the database.

### Creating the EventList component

Inside the `src/components` folder create a new folder called `events` and inside it create a new file called `EventList.tsx`

Add the following code:

```tsx
import { useNavigate } from "react-router-dom";
import { EventCard } from "./EventCard";
import type { Event } from "../../types";
import { LoadingMessage } from "../LoadingMessage";
import { ErrorMessage } from "../ErrorMessage";

interface EventListProps {
  events: EventData[];
  loading: boolean;
  error: string | null;
}

export function EventList({
  events,
  loading = false,
  error = null,
}: EventListProps) {
  const navigate = useNavigate();
  const handleEventClick = (eventId: number) => navigate(`/events/${eventId}`);

  if (loading) return <LoadingMessage message="Loading events..." />;

  if (error) return <ErrorMessage error={error} />;

  if (events.length === 0)
    return (
      <div className="rounded-lg bg-white p-6 text-center text-gray-500 shadow">
        No events found.
      </div>
    );

  return (
    <div className="grid grid-cols-1 gap-4 md:grid-cols-2 lg:grid-cols-3">
      {events.map(event => (
        <EventCard key={event.id} event={event} onClick={handleEventClick} />
      ))}
    </div>
  );
}
```

We start by defining the props that the component will receive. It will receive the events, loading state and error state.

We check if the loading state is true in that case we return a loading message. We do the same for the error state.

If the events array is empty we return a message saying no events found.

If we have a array of events we map over them and return an `EventCard` component for each event. We pass the event to the `EventCard` component and the `onEventClick` function so we can navigate to the event details page when the user clicks on an event.

#### Creating the EventCard component

Create a new file:  
`src/components/events/EventCard.tsx`

With this code:

```tsx
import { formatDate } from "../../utils/dateUtils";
import { MapPinIcon, CalendarIcon } from "lucide-react";
import type { EventData } from "../../types";

interface EventCardProps {
  event: EventData;
  onClick: (eventId: number) => void;
}

export function EventCard({ event, onClick }: EventCardProps) {
  return (
    <div
      className="flex h-full cursor-pointer flex-col overflow-hidden rounded-lg bg-white shadow transition-shadow duration-300 hover:shadow-md"
      onClick={() => onClick(event.id)}
    >
      <div className="flex flex-1 flex-col p-5">
        <h3 className="mb-2 text-lg font-medium text-gray-800">{event.name}</h3>

        <p className="mb-4 line-clamp-2 text-sm text-gray-600">
          {event.description}
        </p>

        <div className="mb-2 flex items-center text-sm text-gray-500">
          <CalendarIcon className="mr-2 h-4 w-4" />
          <p>{formatDate(event.date)}</p>
        </div>

        <div className="flex items-center text-sm text-gray-500">
          <MapPinIcon className="mr-2 h-4 w-4" />
          <p>{event.location}</p>
        </div>
      </div>
    </div>
  );
}
```

We use tailwind to style the component to make it look nice. We then display the details of the event. To show some icons we use the `lucide-react` library. When the user clicks on the event card we navigate to the event details page. Since the date is not really human readable we use a helper function to format it.

Inside the `src/utils` folder create a new file called `dateUtils.ts` with the following code:

```ts
export const formatDate = (dateString: string): string => {
  const date = new Date(dateString);

  if (isNaN(date.getTime())) {
    return "Invalid date format";
  }

  return date.toLocaleDateString(navigator.language, {
    weekday: "short",
    year: "numeric",
    month: "short",
    day: "numeric",
    hour: "2-digit",
    minute: "2-digit",
  });
};
```

We parse the date string to a date object if it is not a valid date we return a message saying invalid date format. Otherwise we return the date in a human readable format.

## 📄 Showing my events data

Since we are using the same `EventList` component in the my events page we can reuse it.

Update the `src/pages/MyEventsPage.tsx` file to the following:

```tsx
import { fetchUserEvents } from "../api/attendees";
import { useAuth } from "../contexts/AuthContext";
import type { EventData } from "../types";
import { EventList } from "../components/events/EventList";
import { useFetch } from "../hooks/useFetch";
import { useCallback } from "react";

export function MyEventsPage() {
  const { auth } = useAuth();
  const getUserEvents = useCallback(
    () => fetchUserEvents(auth?.userId),
    [auth]
  );

  const { data: events, loading, error } = useFetch<EventData[]>(getUserEvents);

  return (
    <div>
      <h1 className="mb-6 text-2xl font-semibold text-gray-800">
        Events I''m Attending
      </h1>
      <EventList
        loading={loading}
        error={error?.message ?? null}
        events={events || []}
      />
    </div>
  );
}
```

This page is very similar to the events page. We are using the same `EventList` component and the same `useFetch` hook but with a different api call.

To fetch the events the user is attending we first need to get the user id from the auth context. We then pass the user id to the `fetchUserEvents` api call.

We wrap the `getUserEvents` function with `useCallback` to prevent it from being recreated on every render. `useCallback` is a React hook that remembers a function between renders, only creating a new version when its dependencies change. Without this, the function would change every time the component re-renders, which would trigger our `useFetch` hook to run again, creating an endless loop of API calls.

All we need to do now is to create the `fetchUserEvents` api call. Inside the `src/api` folder create a new file called `attendees.ts` with the following code:

```ts
import type { EventData } from "../types";
import { API_BASE_URL, apiFetch } from "./api";

export const fetchUserEvents = async (
  userId: number | undefined
): Promise<EventData[]> => {
  if (!userId) {
    return [];
  }

  try {
    const response = await apiFetch(
      `${API_BASE_URL}/v1/attendees/${userId}/events`
    );

    if (!response.ok) {
      throw new Error(`API error: ${response.status}`);
    }

    return await response.json();
  } catch (error) {
    console.error(`Error fetching events for user ${userId}:`, error);
    throw error;
  }
};
```

We are making a GET request to the `/v1/attendees/${userId}/events` endpoint and we are passing the user id to the endpoint.

If we now go to the my events page you should see a message saying no events found. This is because we are not attending any events yet. We will add the ability for a event owner to add attendees to their event later.

## Creating events

Inside the events page we want to add a button to create a new event.

Update the `EventsPage` component to add a button to create a new event.

```tsx
import { useState } from "react";
import { fetchEvents } from "../api/events";
import { EventList } from "../components/events/EventList";
import { AddEventModal } from "../components/events/AddEventModal";
import { useAuth } from "../contexts/AuthContext";
import type { EventData } from "../types";
import { Button } from "../components/Button";
import { PlusIcon } from "lucide-react";
import { useFetch } from "../hooks/useFetch";

export function EventsPage() {
  const { isAuthenticated } = useAuth();
  const [isAddEventModalOpen, setIsAddEventModalOpen] = useState(false);
  const { data, loading, error, refetch } = useFetch<EventData[]>(fetchEvents);
  const events = data ?? [];

  const handleAddEvent = () => {
    refetch();
    setIsAddEventModalOpen(false);
  };

  return (
    <>
      <div className="mb-6 flex items-center justify-between">
        <h1 className="text-2xl font-semibold text-gray-800">Events</h1>
        <div className="flex items-center space-x-4">
          {isAuthenticated && (
            <Button
              icon={<PlusIcon className="mr-1 h-4 w-4" />}
              onClick={() => setIsAddEventModalOpen(true)}
            >
              Add Event
            </Button>
          )}
        </div>
      </div>

      <EventList
        loading={loading}
        error={error?.message ?? null}
        events={events}
      />

      {isAddEventModalOpen && isAuthenticated && (
        <AddEventModal
          isOpen={isAddEventModalOpen}
          onClose={() => setIsAddEventModalOpen(false)}
          onAddEvent={handleAddEvent}
        />
      )}
    </>
  );
}
```

We create a state to keep track of the add event modal open state. This modal will contain a form to create a new event.

Next we have a button to open the modal. When the user clicks the button we set the `isAddEventModalOpen` state to true. This button is only visible if the user is authenticated.

Next we have the `AddEventModal` component. This component is a modal that will contain a form to create a new event.

Let''s create the `AddEventModal` component.

Create a new file:  
`src/components/events/AddEventModal.tsx`

Add the following code:

```tsx
import { XIcon } from "lucide-react";
import { createEvent } from "../../api/events";
import type { EventData } from "../../types";
import { InputGroup } from "../InputGroup";
import { Button } from "../Button";
import { useForm } from "../../hooks/useForm";

interface AddEventModalProps {
  isOpen: boolean;
  onClose: () => void;
  onAddEvent: (event: EventData) => void;
}

interface EventFormData {
  name: string;
  description: string;
  date: string;
  location: string;
}

const initialValues: EventFormData = {
  name: "",
  description: "",
  date: "",
  location: "",
};

export function AddEventModal({
  isOpen,
  onClose,
  onAddEvent,
}: AddEventModalProps) {
  const validate = (values: EventFormData) => {
    const errors: Partial<EventFormData> = {};
    if (values.name.length < 3)
      errors.name = "Name must be at least 3 characters";
    if (values.description.length < 10)
      errors.description = "Description must be at least 10 characters";
    if (!values.date.length) errors.date = "Date is required";
    if (values.location.length < 3)
      errors.location = "Location must be at least 3 characters";
    console.log("errors", errors);
    return errors;
  };

  const onSubmit = async (values: EventFormData) => {
    const date = new Date(values.date);
    const formattedValues = {
      ...values,
      date: date.toISOString(),
    };
    const newEvent = await createEvent(formattedValues);
    onAddEvent(newEvent);
    reset();
    onClose();
  };

  const { values, errors, isLoading, handleChange, handleSubmit, reset } =
    useForm({
      initialValues,
      validate,
      onSubmit,
    });

  if (!isOpen) return null;

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-gray-900/60 p-4"
      onClick={onClose}
    >
      <div
        className="w-full max-w-md rounded-lg bg-white shadow-lg"
        onClick={e => e.stopPropagation()}
      >
        <div className="flex items-center justify-between border-b border-gray-200 p-4">
          <h2 className="text-lg font-semibold text-gray-800">Add New Event</h2>

          <Button variant="secondary" onClick={onClose}>
            <XIcon className="h-5 w-5" />
          </Button>
        </div>

        <form onSubmit={handleSubmit} className="p-4">
          <div className="space-y-4">
            <InputGroup
              name="name"
              label="Name"
              value={values.name}
              onChange={handleChange}
              error={errors.name}
            />

            <InputGroup
              name="description"
              label="Description"
              value={values.description}
              onChange={handleChange}
              error={errors.description}
              isTextArea
            />

            <InputGroup
              name="date"
              type="datetime-local"
              label="Date and Time"
              value={values.date}
              onChange={handleChange}
              error={errors.date}
            />

            <InputGroup
              name="location"
              label="Location"
              value={values.location}
              onChange={handleChange}
              error={errors.location}
            />
          </div>

          <div className="mt-6 flex justify-end space-x-2">
            <Button variant="secondary" onClick={onClose}>
              Cancel
            </Button>
            <Button type="submit" disabled={isLoading}>
              {isLoading ? "Creating..." : "Create Event"}
            </Button>
          </div>
        </form>
      </div>
    </div>
  );
}
```

We start by creating some interfaces for the form data and the props that the component will receive. We also create an initial values object for the form data.

To validate the form data we create a `validate` function. We check length of the input fields and make sure the date is not empty.

Then we have the `onSubmit` function. This function is called when the user submits the form. We parse the date to a ISO string and then we call the `createEvent` api call, then we reset the form and close the modal.

After that we use the `useForm` hook to handle the form data and validation. We pass the initial values, validate function and onSubmit function. We destructure the values, errors, isLoading, handleChange, handleSubmit and reset from the hook.

If the modal is not open we just return null.

We have our modal container. It dims the background and centers the modal. We also stop the event from bubbling up to the parent container. This is because we want to close the modal when the user clicks outside of it however we want to keep the modal open when the user clicks submit and the form has errors.

After that we use the input group component to create the form fields. We pass the state from the `useForm` hook to the inputs. Then we have a submit & cancel button.

Lets add the api call to create a new event. Inside the `src/api/events.ts` file add the following code:

```ts
export const createEvent = async (
  event: Omit<EventData, "id" | "ownerId">
): Promise<EventData> => {
  try {
    const response = await apiFetch(`${API_BASE_URL}/v1/events`, {
      method: "POST",
      body: JSON.stringify(event),
    });

    if (!response.ok) {
      throw new Error(`API error: ${response.status}`);
    }

    return await response.json();
  } catch (error) {
    console.error("Error creating event:", error);
    throw error;
  }
};
```

Here we are using the `Omit` type to omit the `id` and `ownerId` properties from the event object. We are not sending these properties to the API. We do post the event object to the API and the API will return the created event with the id and ownerId.

We can now go to the events page and click the add event button. We should see a modal to create a new event.

If we fill out the form and click create event we should see the new event in the events list.

## 📄 Showing event details

When we click on an event card we want to see the details of the event.

Open the file:  
`src/pages/EventDetailsPage.tsx`

Remove all the code and add the following:

```tsx
import { useCallback } from "react";
import {
  fetchEventAttendees,
  removeAttendeeFromEvent,
  addAttendeeToEvent,
} from "../api/attendees";
import { deleteEvent, fetchEventById } from "../api/events";
import { fetchUsers } from "../api/users";
import { useAuth } from "../contexts/AuthContext";
import type { EventData, User } from "../types";
import { useParams, useNavigate } from "react-router-dom";
import { AddAttendeeModal } from "../components/attendees/AddAttendeeModal";
import { CalendarIcon, MapPinIcon, PencilIcon, TrashIcon } from "lucide-react";
import { formatDate } from "../utils/dateUtils";
import { LoadingMessage } from "../components/LoadingMessage";
import { AttendeeSection } from "../components/attendees/AttendeeSection";
import { Button } from "../components/Button";
import { useFetch } from "../hooks/useFetch";
import { useState } from "react";
import { ErrorMessage } from "../components/ErrorMessage";
import { useAsync } from "../hooks/useAsync";
import { ConfirmModal } from "../components/ConfirmModal";

export function EventDetailsPage() {
  const { auth } = useAuth();
  const { eventId } = useParams();
  const navigate = useNavigate();
  const [isAddAttendeeModalOpen, setIsAddAttendeeModalOpen] = useState(false);
  const [isDeleteConfirmModalOpen, setIsDeleteConfirmModalOpen] =
    useState(false);

  const getEvent = useCallback(
    () => fetchEventById(Number(eventId)),
    [eventId]
  );

  const getAttendees = useCallback(
    () => fetchEventAttendees(Number(eventId)),
    [eventId]
  );

  const {
    data: currentEvent,
    loading: eventLoading,
    error: eventError,
  } = useFetch<EventData>(getEvent);

  const {
    data: attendees,
    refetch: refetchAttendees,
    error: attendeesError,
  } = useFetch<User[]>(getAttendees);

  const getUsersIfAuthenticated = useCallback(
    () => (auth ? fetchUsers() : Promise.resolve([])),
    [auth]
  );

  const {
    data: users,
    loading: usersLoading,
    error: usersError,
  } = useFetch<User[]>(getUsersIfAuthenticated);

  const { run: deleteEventAction, error: deleteEventError } = useAsync({
    action: deleteEvent,
    onSuccess: () => navigate("/events"),
    errorMessage: "Failed to delete event",
  });

  const { run: removeAttendeeAction, error: removeError } = useAsync({
    action: removeAttendeeFromEvent,
    onSuccess: refetchAttendees,
    errorMessage: "Failed to remove attendee",
  });

  const { run: addAttendeeAction, error: addError } = useAsync({
    action: addAttendeeToEvent,
    onSuccess: refetchAttendees,
    errorMessage: "Failed to add attendee",
  });

  const error =
    eventError ||
    attendeesError ||
    usersError ||
    removeError ||
    addError ||
    deleteEventError;

  if (eventLoading) {
    return <LoadingMessage message="Loading..." />;
  }

  const currentAttendees = attendees || [];

  return (
    <div className="mx-auto my-8 flex w-full flex-col overflow-hidden rounded-lg bg-white shadow-lg ">
      {error && <ErrorMessage error={error} />}
      <div className="flex flex-col-reverse gap-4 border-b border-gray-200 p-6 md:flex-row md:items-start md:justify-between">
        <div className="min-w-0 flex-1">
          <h2 className="max-w-xl break-words text-xl font-semibold text-gray-800">
            {currentEvent?.name}
          </h2>
          <p className="mt-1 max-w-xl whitespace-pre-wrap break-words text-gray-600">
            {currentEvent?.description}
          </p>
        </div>
        {auth?.userId === currentEvent?.ownerId && (
          <div className="mb-4 flex flex-shrink-0 gap-2 md:mb-0">
            <Button
              size="small"
              variant="secondary"
              icon={<TrashIcon className="h-4 w-4" />}
              onClick={() => setIsDeleteConfirmModalOpen(true)}
            >
              Delete
            </Button>
            <Button
              size="small"
              variant="secondary"
              icon={<PencilIcon className="h-4 w-4" />}
              onClick={() => navigate(`/events/${eventId}/edit`)}
            >
              Edit
            </Button>
          </div>
        )}
      </div>

      <div className="min-h-[400px] flex-1 p-6">
        <div className="mb-6">
          <h3 className="mb-3 text-lg font-medium text-gray-800">
            Event Details
          </h3>
          <div className="space-y-3">
            <div className="flex items-center text-gray-600">
              <CalendarIcon className="mr-3 h-5 w-5" />
              <span>{formatDate(currentEvent?.date || "")}</span>
            </div>
            <div className="flex items-center text-gray-600">
              <MapPinIcon className="mr-3 h-5 w-5" />
              <span>{currentEvent?.location}</span>
            </div>
          </div>
        </div>

        <AttendeeSection
          attendees={currentAttendees}
          isOwner={auth?.userId === currentEvent?.ownerId}
          setIsAddAttendeeModalOpen={setIsAddAttendeeModalOpen}
          handleRemoveAttendee={attendeeId =>
            removeAttendeeAction(attendeeId, Number(eventId))
          }
        />
      </div>

      <AddAttendeeModal
        isOpen={isAddAttendeeModalOpen}
        isLoading={usersLoading}
        eventId={currentEvent?.id || 0}
        existingAttendees={currentAttendees}
        users={users || []}
        onClose={() => setIsAddAttendeeModalOpen(false)}
        onAdd={userId => addAttendeeAction(Number(eventId), userId)}
      />

      <ConfirmModal
        isOpen={isDeleteConfirmModalOpen}
        title="Delete Event"
        description={`Are you sure you want to delete "${currentEvent?.name}"?`}
        confirmButtonText="Delete"
        onConfirm={() => deleteEventAction(Number(eventId))}
        onClose={() => setIsDeleteConfirmModalOpen(false)}
      />
    </div>
  );
}
```

This is probably the most complex page in our app. The reason for this is that we are fetching multiple pieces of data from the API. We are fetching the event details, the attendees, the users and we also have api calls to add and remove attendees. However the code should still be readable and hopefully not to hard to understand.

After we setup all the api calls with our custom hooks We display the details of the event. We also display the all the attendees for this event. Then we have buttons to edit and delete the event. We also have two modals one for adding attendees and one for confirming the delete event action.

### useAsync hook and api calls

To handle api calls that triggers an action but don''t use a full form we are gonna create a custom hook. To reduce code duplication.

Inside the `src/hooks` folder create a new file called `useAsync.ts` with the following code:

```ts
import { useState } from "react";

export function useAsync<Data, Params extends unknown[]>(config: {
  action: (...params: Params) => Promise<Data>;
  onSuccess?: () => void;
  errorMessage?: string;
}) {
  const [error, setError] = useState<Error | null>(null);

  const run = async (...params: Params) => {
    try {
      setError(null);
      await config.action(...params);
      if (config.onSuccess) {
        await config.onSuccess();
      }
    } catch (err) {
      setError(
        err instanceof Error
          ? err
          : new Error(config.errorMessage ?? "Operation failed")
      );
    }
  };

  return { run, error, setError };
}
```

This will call the api call and handle the error. We can also call a function after the api call is successful.

Now we have 6 new api calls we need to create.

- fetchEventAttendees
- removeAttendeeFromEvent
- addAttendeeToEvent
- deleteEvent
- fetchEventById
- fetchUsers

Inside the `src/api/attendees.ts` file add the following code:

```ts
export const fetchEventAttendees = async (eventId: number): Promise<User[]> => {
  try {
    const response = await apiFetch(
      `${API_BASE_URL}/v1/events/${eventId}/attendees`
    );

    if (!response.ok) {
      throw new Error(`API error: ${response.status}`);
    }

    return await response.json();
  } catch (error) {
    console.error(`Error fetching attendees for event ${eventId}:`, error);
    throw error;
  }
};

export const addAttendeeToEvent = async (
  eventId: number,
  userId: number
): Promise<void> => {
  try {
    const response = await apiFetch(
      `${API_BASE_URL}/v1/events/${eventId}/attendees/${userId}`,
      {
        method: "POST",
      }
    );

    if (!response.ok) {
      throw new Error(`API error: ${response.status}`);
    }
  } catch (error) {
    console.error(
      `Error adding attendee ${userId} to event ${eventId}:`,
      error
    );
    throw error;
  }
};

export const removeAttendeeFromEvent = async (
  attendeeId: number,
  eventId: number
): Promise<void> => {
  try {
    const response = await apiFetch(
      `${API_BASE_URL}/v1/events/${eventId}/attendees/${attendeeId}`,
      {
        method: "DELETE",
      }
    );

    if (!response.ok) {
      throw new Error(`API error: ${response.status}`);
    }
  } catch (error) {
    console.error(
      `Error removing attendee ${attendeeId} from event ${eventId}:`,
      error
    );
    throw error;
  }
};
```

Don''t forget to add the import for the User type.

```ts
import type { User } from "../types";
```

These api calls are very similar to previous api calls we have created. With the only diffrence the data we pass and the api endpoints.

Let''s now create deleteEvent & fetchEventById.

Inside the `src/api/events.ts` file add the following code:

```ts
export const deleteEvent = async (eventId: number): Promise<void> => {
  try {
    const response = await apiFetch(`${API_BASE_URL}/v1/events/${eventId}`, {
      method: "DELETE",
    });

    if (!response.ok) {
      throw new Error(`API error: ${response.status}`);
    }
  } catch (error) {
    console.error(`Error deleting event ${eventId}:`, error);
    throw error;
  }
};

export const fetchEventById = async (eventId: number): Promise<EventData> => {
  try {
    const response = await apiFetch(`${API_BASE_URL}/v1/events/${eventId}`);
    if (!response.ok) {
      throw new Error(`API error: ${response.status}`);
    }
    return await response.json();
  } catch (error) {
    console.error(`Error fetching event ${eventId}:`, error);
    throw error;
  }
};
```

Now we only have fetchUsers left to create.

Create a new file:  
`src/api/users.ts`

Add the following code:

```ts
import type { User } from "../types";
import { API_BASE_URL, apiFetch } from "./api";

export const fetchUsers = async (): Promise<User[]> => {
  try {
    const response = await apiFetch(`${API_BASE_URL}/v1/users`);

    if (!response.ok) {
      throw new Error(`API error: ${response.status}`);
    }

    return await response.json();
  } catch (error) {
    console.error("Error fetching users:", error);
    throw error;
  }
};
```

### Attendee section

When viewing an event we want to show the attendees for that event. Start by creating a new folder in the `src/components` folder called `Attendees`.

Inside the `Attendees` folder create a new file called `AttendeeSection.tsx`

Add the following code:

```tsx
import type { User } from "../../types";
import { AttendeeHeader } from "./AttendeeHeader";
import { AttendeeList } from "./AttendeeList";

export function AttendeeSection({
  attendees,
  isOwner,
  setIsAddAttendeeModalOpen,
  handleRemoveAttendee,
}: {
  attendees: User[];
  isOwner: boolean;
  setIsAddAttendeeModalOpen: (isOpen: boolean) => void;
  handleRemoveAttendee: (id: number) => void;
}) {
  return (
    <div>
      <AttendeeHeader
        attendees={attendees}
        isOwner={isOwner}
        setIsAddAttendeeModalOpen={setIsAddAttendeeModalOpen}
      />
      <AttendeeList
        attendees={attendees}
        isOwner={isOwner}
        onRemoveAttendee={handleRemoveAttendee}
      />
    </div>
  );
}
```

This component is a container for the attendee header and list. We pass the attendees, isOwner, setIsAddAttendeeModalOpen and handleRemoveAttendee to the component.

#### Attendee header

In this componenet we will display the number of attendees and the button to add an attendee.

Create a new file:  
`src/components/Attendees/AttendeeHeader.tsx`

Add the following code:

```tsx
import { PlusIcon } from "lucide-react";
import type { User } from "../../types";
import { Button } from "../Button";

interface AttendeeHeaderProps {
  attendees: User[];
  isOwner: boolean;
  setIsAddAttendeeModalOpen: (isOpen: boolean) => void;
}

export function AttendeeHeader({
  attendees,
  isOwner,
  setIsAddAttendeeModalOpen,
}: AttendeeHeaderProps) {
  return (
    <div className="mb-1 flex items-center justify-between">
      <h3 className="text-lg font-medium text-gray-800">
        {attendees.length > 0 ? "Attendees" : "No attendees yet"}{" "}
        <span className="text-sm text-gray-500">({attendees.length})</span>
      </h3>
      {isOwner && (
        <Button
          variant="secondary"
          size="small"
          icon={<PlusIcon className="h-4 w-4" />}
          onClick={() => setIsAddAttendeeModalOpen(true)}
        >
          Add Attendee
        </Button>
      )}
    </div>
  );
}
```

We display the number of attendees and the button to add an attendee. If the user is the owner of the event we show the button to add an attendee.

#### Attendee list

Create a new file:  
`src/components/Attendees/AttendeeList.tsx`

Add the following code:

```tsx
import type { User } from "../../types";
import { XIcon, CheckIcon } from "lucide-react";
import { Button } from "../Button";
import clsx from "clsx";

interface AttendeeListProps {
  attendees: User[];
  mode?: "display" | "selection";
  isOwner?: boolean;
  selectedAttendee?: User | null;
  onAttendeeSelect?: (attendee: User) => void;
  onRemoveAttendee?: (id: number) => void;
}

export function AttendeeList({
  attendees = [],
  mode = "display",
  isOwner,
  selectedAttendee,
  onAttendeeSelect = () => {},
  onRemoveAttendee = () => {},
}: AttendeeListProps) {
  if (attendees.length === 0) return null;

  return (
    <div>
      <ul className="h-full divide-y divide-gray-200 pb-6">
        {attendees.map(({ id, name, email }) => (
          <li
            key={id}
            className={clsx(
              "group flex items-center justify-between py-4 hover:bg-gray-50",
              mode === "selection" && {
                "cursor-pointer": true,
                "bg-blue-50": selectedAttendee?.id === id,
              }
            )}
            onClick={() =>
              mode === "selection" && onAttendeeSelect({ id, name, email })
            }
          >
            <div>
              <p className="font-medium text-gray-800">{name}</p>
              <p className="text-sm text-gray-600">{email}</p>
            </div>
            {mode === "display" && isOwner && onRemoveAttendee && (
              <Button
                size="small"
                className="mr-4 cursor-pointer rounded-full p-1.5 opacity-0 hover:bg-red-50 group-hover:opacity-100"
                onClick={() => onRemoveAttendee(id)}
                variant="secondary"
              >
                <XIcon className="h-5 w-5 text-gray-400 hover:text-red-500" />
              </Button>
            )}
            {mode === "selection" && selectedAttendee?.id === id && (
              <CheckIcon className="mr-4 h-5 w-5 text-blue-600" />
            )}
          </li>
        ))}
      </ul>
    </div>
  );
}
```

This component is a list of attendees. We display the name and email of the attendee. If the user is the owner of the event we show a button to remove the attendee. If the user is in selection mode we show a check icon if the attendee is selected. This is because we will use this component in the add attendee modal.

### Add attendee modal

When clicking the add attendee button we want to show a modal with a list of users. It shoulder be possible to search for a user. We also only want to show users that are not already attending the event.

Let''s start with the search bar.

This will be used to filter the users.

Create a new file:  
`src/components/SearchBar.tsx`

Add the following code:

```tsx
import { SearchIcon } from "lucide-react";
import type { ChangeEventHandler } from "react";

export function SearchBar({
  value,
  onChange,
}: {
  value: string;
  onChange: ChangeEventHandler<HTMLInputElement>;
}) {
  return (
    <div className="border-b border-gray-200 py-4">
      <div className="relative">
        <div className="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3">
          <SearchIcon className="h-4 w-4 text-gray-400" />
        </div>
        <input
          type="text"
          placeholder="Search users..."
          className="w-full rounded-md border border-gray-300 py-2 pl-10 pr-4 focus:outline-none focus:ring-2 focus:ring-blue-500"
          value={value}
          onChange={onChange}
        />
      </div>
    </div>
  );
}
```

It''s a simple input component with a search icon. It takes 2 props value and onChange.

Now we need to create the modal that will be used to add an attendee.

Create a new file:  
`src/components/Attendees/AddAttendeeModal.tsx`

This modal component allows event owners to add new attendees to their events. It includes several key features:

Add the following code:

```tsx
import { useState } from "react";
import { XIcon } from "lucide-react";
import type { User } from "../../types";
import { LoadingMessage } from "../LoadingMessage";
import { Button } from "../Button";
import { SearchBar } from "../SearchBar";
import { AttendeeList } from "./AttendeeList";

interface AddAttendeeModalProps {
  isOpen: boolean;
  onClose: () => void;
  eventId: number;
  existingAttendees: User[];
  users: User[];
  isLoading: boolean;
  onAdd: (userId: number) => Promise<void>;
}

export function AddAttendeeModal({
  isOpen,
  onClose,
  existingAttendees,
  users,
  isLoading,
  onAdd,
}: AddAttendeeModalProps) {
  const [searchTerm, setSearchTerm] = useState("");
  const [selectedUser, setSelectedUser] = useState<User | null>(null);
  const [isAdding, setIsAdding] = useState(false);

  const availableUsers = users.filter(
    user => !existingAttendees.some(attendee => attendee.id === user.id)
  );

  const filteredUsers =
    searchTerm.trim() === ""
      ? availableUsers
      : availableUsers.filter(
          user =>
            user.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
            user.email.toLowerCase().includes(searchTerm.toLowerCase())
        );

  const handleAddAttendee = async (userToAdd: User) => {
    try {
      setIsAdding(true);
      await onAdd(userToAdd.id);
    } finally {
      setIsAdding(false);
    }
  };

  const handleClose = () => {
    setSearchTerm("");
    setSelectedUser(null);
    onClose();
  };

  if (!isOpen) return null;

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-gray-900/60 p-4"
      onClick={onClose}
    >
      <div
        className="flex h-full max-h-[90vh] w-full max-w-xl flex-col overflow-hidden rounded-lg bg-white p-4 shadow-lg"
        onClick={e => e.stopPropagation()}
      >
        <div className="flex items-center justify-between border-b border-gray-200 py-4">
          <h2 className="text-lg font-semibold text-gray-800">Add Attendee</h2>
          <Button size="small" variant="secondary" onClick={onClose}>
            <XIcon className="h-5 w-5" />
          </Button>
        </div>

        <SearchBar
          value={searchTerm}
          onChange={e => setSearchTerm(e.target.value)}
        />

        <div className="flex-1 overflow-y-auto p-1">
          {isLoading ? (
            <LoadingMessage message="Loading..." />
          ) : (
            <AttendeeList
              attendees={filteredUsers}
              mode="selection"
              selectedAttendee={selectedUser}
              onAttendeeSelect={setSelectedUser}
            />
          )}
        </div>

        <div className="flex justify-end space-x-2 border-t border-gray-200 p-4">
          <Button variant="secondary" onClick={handleClose}>
            Cancel
          </Button>
          <Button
            onClick={() => selectedUser && handleAddAttendee(selectedUser)}
            disabled={!selectedUser || isAdding}
          >
            {isAdding ? "Adding..." : "Add"}
          </Button>
        </div>
      </div>
    </div>
  );
}
```

1. **User Filtering**: Only shows users who aren''t already attending the event
2. **Search Functionality**: Users can search by name or email to quickly find people
3. **Selection Mode**: Users can select someone from the list before adding them
4. **Loading States**: Shows loading indicators during API calls

The component manages local state for the search term, selected user, and loading states. It filters the available users based on existing attendees and the search input, making it easy to find and add new people to events.

### Confirm delete event modal

When deleting an event we want to show a modal to confirm the action.

Create a new file:  
`src/components/ConfirmModal.tsx`

Add the following code:

```tsx
import { Button } from "./Button";

interface ConfirmModalProps {
  isOpen: boolean;
  title: string;
  description: string;
  confirmButtonText: string;
  cancelButtonText?: string;
  onConfirm: () => void;
  onClose: () => void;
}

export function ConfirmModal({
  isOpen,
  title,
  description,
  confirmButtonText,
  cancelButtonText = "Cancel",
  onConfirm,
  onClose,
}: ConfirmModalProps) {
  if (!isOpen) return null;

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-gray-900/60 p-4"
      onClick={onClose}
    >
      <div
        className="w-full max-w-md rounded-lg bg-white shadow-lg"
        onClick={e => e.stopPropagation()}
      >
        <div className="flex items-center justify-between border-b border-gray-200 p-4">
          <h2 className="text-lg font-semibold text-gray-800">{title}</h2>
        </div>

        <div className="p-4">
          <p className="mb-6 text-gray-600">{description}</p>
          <div className="flex justify-end space-x-2">
            <Button variant="secondary" onClick={onClose}>
              {cancelButtonText}
            </Button>
            <Button
              variant="primary"
              onClick={() => {
                onConfirm();
                onClose();
              }}
            >
              {confirmButtonText}
            </Button>
          </div>
        </div>
      </div>
    </div>
  );
}
```

This is a simple modal component with a title, description, confirm button and cancel button.

You show now be able to see the details of the event. Add & remove attendees if you are the owner of the event and delete the event.

## Edit event page

The last page we need to create is the edit event page. This page allows event owners to modify their existing events.

Create a new file:  
`src/pages/EditEventPage.tsx`

Add the following code:

```tsx
import { useForm } from "../hooks/useForm";
import { CheckIcon } from "lucide-react";
import { InputGroup } from "../components/InputGroup";
import { Button } from "../components/Button";
import { formatDateForInput } from "../utils/dateUtils";
import { useNavigate, useParams } from "react-router-dom";
import { fetchEventById, updateEvent } from "../api/events";
import { useFetch } from "../hooks/useFetch";
import type { EventData } from "../types";
import { useCallback, useState, useMemo } from "react";
import { LoadingMessage } from "../components/LoadingMessage";
import { ErrorMessage } from "../components/ErrorMessage";

export function EditEventPage() {
  const { eventId } = useParams();
  const [isSubmitting, setIsSubmitting] = useState(false);
  const navigate = useNavigate();

  const getEvent = useCallback(
    () => fetchEventById(Number(eventId)),
    [eventId]
  );

  const {
    data: currentEvent,
    loading: isLoading,
    error,
  } = useFetch<EventData>(getEvent);

  const initialValues = useMemo(
    () => ({
      name: currentEvent?.name || "",
      description: currentEvent?.description || "",
      date: formatDateForInput(currentEvent?.date || ""),
      location: currentEvent?.location || "",
    }),
    [currentEvent]
  );

  const validate = (values: typeof initialValues) => {
    const errors: Partial<typeof initialValues> = {};
    if (values.name.length < 3)
      errors.name = "Name must be at least 3 characters";
    if (values.description.length < 10)
      errors.description = "Description must be at least 10 characters";
    if (!values.date) errors.date = "Date is required";
    if (values.location.length < 3)
      errors.location = "Location must be at least 3 characters";
    return errors;
  };

  const handleSubmit = async (values: typeof initialValues) => {
    if (!currentEvent?.id) return;
    setIsSubmitting(true);
    try {
      const date = new Date(values.date);
      const formattedValues = {
        ...values,
        date: date.toISOString(), // Full ISO string with timezone: YYYY-MM-DDThh:mm:ss.sssZ
      };
      await updateEvent(currentEvent.id, formattedValues);
      navigate(`/events/${currentEvent.id}`);
    } catch (error) {
      console.error("Failed to update event:", error);
    } finally {
      setIsSubmitting(false);
    }
  };

  const {
    values,
    errors,
    handleChange,
    handleSubmit: onFormSubmit,
  } = useForm({
    initialValues,
    validate,
    onSubmit: handleSubmit,
  });

  if (isLoading) {
    return <LoadingMessage message="Loading event..." />;
  }

  if (error) {
    return <ErrorMessage error={error} />;
  }

  return (
    <div className="mx-auto my-8 flex h-[600px] w-full flex-col overflow-hidden rounded-lg bg-white shadow-lg">
      <div className="border-b border-gray-200 p-6">
        <h2 className="text-xl font-semibold text-gray-800">Edit Event</h2>
      </div>

      <div className="flex-1 overflow-y-auto p-6">
        <form
          id="edit-event-form"
          onSubmit={onFormSubmit}
          className="space-y-4"
        >
          <InputGroup
            name="name"
            label="Name"
            value={values.name}
            onChange={handleChange}
            error={errors.name}
          />
          <InputGroup
            name="description"
            label="Description"
            value={values.description}
            onChange={handleChange}
            isTextArea
            rows={3}
            error={errors.description}
          />
          <InputGroup
            name="date"
            label="Date and Time"
            value={values.date}
            onChange={handleChange}
            type="datetime-local"
            error={errors.date}
          />
          <InputGroup
            name="location"
            label="Location"
            value={values.location}
            onChange={handleChange}
            error={errors.location}
          />
        </form>
      </div>

      <div className="flex justify-between border-t border-gray-200 p-4">
        <Button
          variant="secondary"
          type="button"
          onClick={() => {
            navigate(`/events/${currentEvent?.id}`);
          }}
        >
          Cancel
        </Button>
        <Button
          type="submit"
          form="edit-event-form"
          icon={<CheckIcon className="mr-1 h-4 w-4" />}
          disabled={isSubmitting}
        >
          {isSubmitting ? "Saving..." : "Save Changes"}
        </Button>
      </div>
    </div>
  );
}
```

The component first fetches the current event data, then creates initial form values from that data. It uses the same validation rules as the create event functionality to ensure consistency across the app.

1. **Data Pre-population**: Fetches existing event data and populates the form fields
2. **Optimized Re-renders**: Uses `useMemo` to prevent unnecessary form resets when the component re-renders
3. **Form Integration**: Reuses our custom `useForm` hook with validation
4. **Loading States**: Shows loading indicators while fetching event data
5. **Error Handling**: Displays appropriate error messages for failed operations

We need to create the `updateEvent` api call. Inside the `src/api` update the `events.ts` file with the following code:

```ts
export const updateEvent = async (
  eventId: number,
  eventData: Omit<EventData, "id" | "attendees" | "ownerId">
): Promise<EventData> => {
  try {
    const response = await apiFetch(`${API_BASE_URL}/v1/events/${eventId}`, {
      method: "PUT",
      body: JSON.stringify(eventData),
    });

    if (!response.ok) {
      throw new Error(`API error: ${response.status}`);
    }

    return await response.json();
  } catch (error) {
    console.error(`Error updating event ${eventId}:`, error);
    throw error;
  }
};
```

Then we need to add a helper function to format the date for the input. Inside the `src/utils` folder update the `dateUtils.ts` file with the following code:

```ts
export const formatDateForInput = (dateString: string) => {
  const date = new Date(dateString);
  if (isNaN(date.getTime())) return "";

  // Format as YYYY-MM-DDThh:mm
  return new Date(date.getTime() - date.getTimezoneOffset() * 60000)
    .toISOString()
    .slice(0, 16);
};
```

This function formats the date that is returned from the input to the correct format.
`
You should now be able to edit an event try it out.

## Updating header styling & mobile responsiveness

Currently the headers styling is not great and it''s not responsive. Let''s fix that.

Update the `src/components/Header.tsx` file with the following code:

```tsx
import { Link, NavLink, useNavigate } from "react-router-dom";
import { useAuth } from "../../contexts/AuthContext";
import { Menu, X, CalendarIcon, UserIcon } from "lucide-react";
import { useState } from "react";
import clsx from "clsx";
import { Button } from "../Button";

const navItems = [
  { to: "/", label: "All Events", icon: CalendarIcon },
  { to: "/my-events", label: "Attending", icon: UserIcon },
];

export function Header() {
  const { logout, isAuthenticated } = useAuth();
  const navigate = useNavigate();
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);
  const closeMobileMenu = () => setIsMobileMenuOpen(false);

  const handleLogout = () => {
    logout();
    navigate("/");
    closeMobileMenu();
  };

  const getNavLinkClass = (isActive: boolean, isMobile: boolean) =>
    clsx(
      "flex items-center text-sm transition-colors",
      isActive
        ? "text-blue-600 font-medium"
        : "text-gray-600 hover:text-gray-900",
      isMobile && "py-2 rounded-md"
    );

  const NavigationLinks = ({ isMobile = false }) => (
    <>
      {navItems.map(({ to, label, icon: Icon }) => (
        <NavLink
          key={to}
          to={to}
          onClick={isMobile ? closeMobileMenu : undefined}
          className={({ isActive }) => getNavLinkClass(isActive, isMobile)}
        >
          <Icon className="mr-2 h-4 w-4" />
          {label}
        </NavLink>
      ))}
    </>
  );

  const AuthButtons = ({ isMobile = false }) => {
    const baseButtonClass = clsx(
      "text-sm font-medium transition-colors rounded-md",
      isMobile ? "px-3 py-2 mb-4" : "px-4 py-2"
    );

    if (isAuthenticated) {
      return (
        <Button variant="secondary" size="small" onClick={handleLogout}>
          Logout
        </Button>
      );
    }

    return (
      <>
        <Link
          to="/login"
          onClick={isMobile ? closeMobileMenu : undefined}
          className={clsx(
            baseButtonClass,
            "bg-blue-600 text-white hover:bg-blue-700",
            { "block text-center": isMobile }
          )}
        >
          Login
        </Link>
        <Link
          to="/register"
          onClick={isMobile ? closeMobileMenu : undefined}
          className={clsx(
            baseButtonClass,
            "border border-gray-300 text-gray-700 hover:bg-gray-50",
            { "block text-center": isMobile }
          )}
        >
          Register
        </Link>
      </>
    );
  };

  return (
    <header className="relative bg-white shadow-sm">
      <div className="container mx-auto px-4">
        <div className="flex h-16 items-center justify-between">
          <Link to="/" className="flex flex-shrink-0 flex-col">
            <h1 className="text-lg font-bold text-gray-800">
              Event Management System
            </h1>
            <p className="text-xs text-gray-500">Made with React & Go ❤️</p>
          </Link>
          <nav className="hidden items-center space-x-8 md:flex">
            {isAuthenticated && (
              <div className="flex items-center gap-6">
                <NavigationLinks />
              </div>
            )}
            <div className="flex items-center space-x-3">
              <AuthButtons />
            </div>
          </nav>
          <div className="md:hidden">
            <Button
              onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
              variant="secondary"
              icon={
                isMobileMenuOpen ? (
                  <X className="h-5 w-5" />
                ) : (
                  <Menu className="h-5 w-5" />
                )
              }
            ></Button>
          </div>
        </div>
        <div
          className={clsx(
            "transition-all duration-300 ease-in-out md:hidden",
            isMobileMenuOpen ? "max-h-96 pb-4 opacity-100" : "max-h-0 opacity-0"
          )}
        >
          <nav className="border-t border-gray-200 pt-4">
            {isAuthenticated && (
              <div className="mb-4 space-y-3">
                <NavigationLinks isMobile />
              </div>
            )}

            <AuthButtons isMobile />
          </nav>
        </div>
      </div>
    </header>
  );
}
```

This updated Header component creates a modern, responsive navigation bar with several key features:

- **Mobile-First Design**: Includes a hamburger menu that works on small screens
- **Authentication Aware**: Shows different navigation options based on whether the user is logged in
- **Active Link Highlighting**: Uses React Router''s `NavLink` to highlight the current page
- **Smooth Animations**: The mobile menu opens and closes with CSS transitions
- **Reusable Components**: Separates navigation links and auth buttons into their own functions for cleaner code

The header automatically adapts between desktop and mobile layouts.

## 🎉 Conclusion

Congratulations! You''ve successfully built a complete event management app using **React**, **TypeScript**, **Tailwind CSS**, and **React Router**.

Throughout this tutorial, you''ve mastered key React concepts including custom hooks, Context API, form handling, and API integration. You''ve created a fully functional app with user authentication, event CRUD operations, attendee management, and responsive design.

The patterns and techniques you''ve learned here will serve you well in any React project. Consider enhancing your app further with real-time updates, image uploads, or calendar integration.

Keep building and keep learning! 🚀', NULL, NULL, '1', 'Ready to get started?', 'Get instant access to all content and downloads', 'Buy Now', '1', '0', '0', '1', '0', '1753402500000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '1763818178849', '1763818267287');

