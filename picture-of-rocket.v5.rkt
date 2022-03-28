;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname picture-of-rocket.v5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; Constant
(define HEIGHT 200)
(define WIDTH 400)
(define MTSCN (empty-scene WIDTH HEIGHT "blue"))
(define ROCK-BED-HEIGHT 10)
(define ROCK-BED (rectangle WIDTH ROCK-BED-HEIGHT "solid" "Medium Brown"))
(define ROCK-BED-X (/ (image-width MTSCN) 2))
(define ROCK-BED-Y (- (image-height MTSCN) (/ ROCK-BED-HEIGHT 2)))
(define MTSCN-WITH-ROCK-BED (place-image ROCK-BED ROCK-BED-X ROCK-BED-Y MTSCN))
(define ROCKET (overlay (circle 10 "solid" "green") (rectangle 40 4 "solid" "green")))
(define ROCKET-CENTER-TO-TOP (- (- (image-height MTSCN-WITH-ROCK-BED) ROCK-BED-HEIGHT)  (/ (image-height ROCKET) 2)))
(define ROCKET-X (/ WIDTH 2))
(define V 5)

; Function
(define (picture-of-rocket.v5 t)
  (cond
    [(<= (distance t) ROCKET-CENTER-TO-TOP) (place-image ROCKET ROCKET-X (distance t) MTSCN-WITH-ROCK-BED)]
    [(> (distance t) ROCKET-CENTER-TO-TOP) (place-image ROCKET ROCKET-X ROCKET-CENTER-TO-TOP MTSCN-WITH-ROCK-BED)]))

(define (distance t)
  (* V t))