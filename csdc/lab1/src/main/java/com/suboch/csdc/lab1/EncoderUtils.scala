package com.suboch.csdc.lab1

import java.io.{BufferedWriter, File, FileWriter}
import java.nio.file.{Files, Paths}

import scala.io.Source

object EncoderUtils {
  val OUTPUT_PATH = "out"

  val CAESAR_INPUT_PATH = "input_caesar.txt"
  val CAESAR_ENCODED_OUTPUT_FILE = "output_encoded_caesar.txt"
  val CAESAR_DECODED_OUTPUT_FILE = "output_decoded_caesar.txt"

  var VIGENERE_INPUT_PATH = "input_vigenere.txt"
  var VIGENERE_ENCODED_OUTPUT_FILE = "output_encoded_vigenere.txt"
  var VIGENERE_DECODED_OUTPUT_FILE = "output_decoded_vigenere.txt"

  val FREQUENCIES_PATH_RU = "frequencies_ru.txt"
  val FREQUENCIES_PATH_EN = "frequencies_en.txt"
  val BOUNDARIES_RU = ('Я', 33, 1040)
  val BOUNDARIES_EN = ('Z', 26, 65)

  def writeToFile(text: String, file: File): Unit = {
    if (!Files.exists(Paths.get(EncoderUtils.OUTPUT_PATH))) {
      Files.createDirectory(Paths.get(EncoderUtils.OUTPUT_PATH))
    }

    val bw = new BufferedWriter(new FileWriter(file))
    bw.write(text)
    bw.close()
  }

  def getFrequencies: Seq[(Char, Double)] = {
    Source.fromResource(EncoderUtils.FREQUENCIES_PATH_EN)
      .getLines()
      .map(m => {
        val Array(k, v) = m.split(" ")
        k.charAt(0) -> v.toDouble
      })
      .toSeq
      .sortBy(_._2)
  }

  def scale(value: Double): Double = {
    BigDecimal(value).setScale(5, BigDecimal.RoundingMode.HALF_UP).toDouble
  }
}