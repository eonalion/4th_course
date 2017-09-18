package com.suboch.csdc.lab1

import java.io.{BufferedWriter, FileWriter}
import java.nio.file.{Files, Paths}

import scala.io.Source

object CaesarCipher {
  var boundaries = EncoderUtils.BOUNDARIES_EN

  def main(args: Array[String]): Unit = {
    val language = args(0)
    val shift = args(1).toInt
    boundaries = EncoderUtils.setBoundaries(language)

    val message = Source.fromResource(EncoderUtils.CAESAR_INPUT_PATH).getLines().mkString.toUpperCase
    val encodedMessage = encode(message.toUpperCase, shift)
    val decodedMessage = decode(encodedMessage, getFrequencies)

    if (!Files.exists(Paths.get(EncoderUtils.OUTPUT_PATH))) {
      Files.createDirectory(Paths.get(EncoderUtils.OUTPUT_PATH))
    }

    val bw = new BufferedWriter(new FileWriter(Paths.get(EncoderUtils.OUTPUT_PATH, EncoderUtils.CAESAR_OUTPUT_FILE).toFile))
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
      .map(e => e._1 -> EncoderUtils.scale(e._2.length.toDouble / letterAmount.toDouble))

    encodedMessage.map(c =>
      if (c.isLetter)
        findCharWithClosestFrequency((c, actualFrequencies(c)), frequencies)
      else
        c
    )
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

    if (boundaries.equals(EncoderUtils.BOUNDARIES_RU)) {
      frequenciesFilePath = EncoderUtils.FREQUENCIES_PATH_RU
    } else {
      frequenciesFilePath = EncoderUtils.FREQUENCIES_PATH_EN
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