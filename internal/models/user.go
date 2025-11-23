package models

import (
	"errors"

	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

type User struct {
	ID       uint   `gorm:"primaryKey"`
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
