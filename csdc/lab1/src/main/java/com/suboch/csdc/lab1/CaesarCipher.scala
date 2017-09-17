package com.suboch.csdc.lab1

import java.io.{BufferedWriter, FileWriter}
import java.nio.file.{Files, Paths}

import scala.io.Source

object CaesarCipher {
  val CAESAR_INPUT_PATH = "input_caesar.txt"
  val CAESAR_OUTPUT_PATH = "out"
  val CAESAR_OUTPUT_FILE = "output_caesar.txt"
  val FREQUENCIES_PATH_RU = "frequencies_ru.txt"
  val FREQUENCIES_PATH_EN = "frequencies_en.txt"

  val BOUNDARIES_RU = ('Я', 33)
  val BOUNDARIES_EN = ('Z', 26)
  var boundaries = BOUNDARIES_EN

  def main(args: Array[String]): Unit = {
    val language = args(1)
    val shift = args(2).toInt
    setBoundaries(language)

    val message = Source.fromResource(CAESAR_INPUT_PATH).getLines().mkString.toUpperCase
    val encodedMessage = encode(message.toUpperCase, shift)
    val decodedMessage = decode(encodedMessage, getFrequencies)

    if (!Files.exists(Paths.get(CAESAR_OUTPUT_PATH))) {
      Files.createDirectory(Paths.get(CAESAR_OUTPUT_PATH))
    }

    val bw = new BufferedWriter(new FileWriter(Paths.get(CAESAR_OUTPUT_PATH, CAESAR_OUTPUT_FILE).toFile))
    bw.write(decodedMessage)
    bw.close()
  }

  def encode(message: String, shift: Int): String = {
    message.map(symbol =>
      if (!symbol.isLetter)
        symbol
      else if (symbol + shift > boundaries._1)
        symbol - (boundaries._2 - shift) toChar
      else
        symbol + shift toChar
    )
  }

  def decode(encodedMessage: String, frequencies: Seq[(Char, Double)]): String = {
    val letterAmount = countLetters(encodedMessage)

    val actualFrequencies = encodedMessage
      .filter(p => p.isLetter)
      .groupBy(c => c)
      .map(e => e._1 -> scale(e._2.length.toDouble / letterAmount.toDouble))

    encodedMessage.map(c =>
      if (c.isLetter)
        findCharWithClosestFrequency((c, actualFrequencies(c)), frequencies)
      else
        c
    )
  }

  def setBoundaries(language: String): Unit = {
    if (language.equalsIgnoreCase("RU")) {
      boundaries = BOUNDARIES_RU
    } else {
      boundaries = BOUNDARIES_EN
    }
  }

  def scale(value: Double): Double = {
    BigDecimal(value).setScale(5, BigDecimal.RoundingMode.HALF_UP).toDouble
  }

  def countLetters(text: String): Int = {
    var amount = 0
    text.foreach(p => if (p.isLetter) amount += 1)
    amount
  }

  def findCharWithClosestFrequency(currentVal: (Char, Double), frequencies: Seq[(Char, Double)]): Char = {
    var difference = 1.0
    var value = currentVal
    frequencies.foreach(f => {
      val currentDifference = Math.abs(f._2 - currentVal._2)
      if (currentDifference < difference) {
        difference = currentDifference
        value = f
      }
    })

    value._1
  }

  def getFrequencies: Seq[(Char, Double)] = {
    var frequenciesFilePath = ""

    if (boundaries.equals(BOUNDARIES_RU)) {
      frequenciesFilePath = FREQUENCIES_PATH_RU
    } else {
      frequenciesFilePath = FREQUENCIES_PATH_EN
    }

    Source.fromResource(frequenciesFilePath)
      .getLines()
      .map(m => {
        val Array(k, v) = m.split(" ")
        k.charAt(0) -> v.toDouble
      })
      .toSeq
      .sortBy(_._2)
  }
}