package main

import "github.com/gin-gonic/gin"

func main() {
	r := gin.Default()
	r.GET("/", index)
	r.Run(":8080")
}

func index(c *gin.Context) {
	c.JSON(200, gin.H{
		"message": "salut!",
		"version": "2.1",
	})
}
