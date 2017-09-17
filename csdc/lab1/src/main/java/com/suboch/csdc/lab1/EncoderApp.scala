package com.suboch.csdc.lab1

object EncoderApp {
  def main(args: Array[String]): Unit = {
    val cipher = 2
    cipher match {
      case 1 => CaesarCipher.main(Array("en", "10"))
      case 2 => VigenereCipher.main(Array("en", "mouse"))
      case whoa => println("Invalid cipher number.")
    }
  }
}