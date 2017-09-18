package com.suboch.csdc.lab1

object EncoderUtils {
  val CAESAR_INPUT_PATH = "input_caesar.txt"
  val VIGENERE_INPUT_PATH = "input_vigenere.txt"
  val OUTPUT_PATH = "out"
  val CAESAR_OUTPUT_FILE = "output_caesar.txt"
  val VIGENERE_ENCODED_OUTPUT_FILE = "output_vigenere_encoded.txt"
  val VIGENERE_DECODED_OUTPUT_FILE = "output_vigenere_decoded.txt"

  val FREQUENCIES_PATH_RU = "frequencies_ru.txt"
  val FREQUENCIES_PATH_EN = "frequencies_en.txt"

  val BOUNDARIES_RU = ('Я', 33, 1040)
  val BOUNDARIES_EN = ('Z', 26, 65)

  def setBoundaries(language: String): (Char, Int, Int) = {
    if (language.equalsIgnoreCase("RU")) {
       EncoderUtils.BOUNDARIES_RU
    } else {
       EncoderUtils.BOUNDARIES_EN
    }
  }

  def scale(value: Double): Double = {
    BigDecimal(value).setScale(5, BigDecimal.RoundingMode.HALF_UP).toDouble
  }
}