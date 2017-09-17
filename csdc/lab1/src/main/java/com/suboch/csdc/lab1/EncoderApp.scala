package com.suboch.csdc.lab1

object EncoderApp {
  def main(args: Array[String]): Unit = {
    val cipher = args(0).toInt
    cipher match {
      case 1 => CaesarCipher.main(args)
      case whoa => println("Invalid cipher number.")
    }
  }
}