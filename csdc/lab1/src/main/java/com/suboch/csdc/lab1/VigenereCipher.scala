package com.suboch.csdc.lab1

import java.io.{BufferedWriter, FileWriter}
import java.nio.file.{Files, Paths}

import scala.io.Source

object VigenereCipher {
  val CAESAR_INPUT_PATH = "input_vigenere.txt"
  val CAESAR_OUTPUT_PATH = "out"
  val CAESAR_OUTPUT_FILE = "output_vigenere.txt"
  val FREQUENCIES_PATH_RU = "frequencies_ru.txt"
  val FREQUENCIES_PATH_EN = "frequencies_en.txt"

  val BOUNDARIES_RU = ('Я', 33, 1040)
  val BOUNDARIES_EN = ('Z', 26, 65)
  var boundaries = BOUNDARIES_EN

  def main(args: Array[String]): Unit = {
    val language = args(0)
    val key = args(1).toUpperCase()
    setBoundaries(language)

    val message = Source.fromResource(CAESAR_INPUT_PATH).getLines().mkString.toUpperCase
    val encodedMessage = encode(message.toUpperCase, key)
  }

  def setBoundaries(language: String): Unit = {
    if (language.equalsIgnoreCase("RU")) {
      boundaries = BOUNDARIES_RU
    } else {
      boundaries = BOUNDARIES_EN
    }
  }

  def encode(text: String, key: String): String = {
    var textPosition = 0
    var keyPosition = 0
    var res = ' '

    text.map(symbol => {
      keyPosition = textPosition % key.length

      if (!symbol.isLetter)
        res = symbol
      else {
        val keyChar = key.charAt(keyPosition)
        val textChar = text.charAt(textPosition)
        res = keyChar + (textChar - boundaries._3) toChar

        if (res > boundaries._1)
          res = boundaries._3 + (res - boundaries._1 - 1) toChar
      }

      textPosition += 1
      res
    })
  }

  def decode(encodedMessage: String, frequencies: Seq[(Char, Double)]): String = ???
}