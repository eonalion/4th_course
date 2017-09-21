package com.suboch.csdc.lab1

import java.nio.file.Paths

import scala.io.Source

object CaesarCipher {
  val CAESAR_SHIFT = 6

  def main(args: Array[String]): Unit = {
    val message = Source.fromResource(EncoderUtils.CAESAR_INPUT_PATH).getLines().mkString.toUpperCase
    val encodedMessage = encode(message.toUpperCase, CAESAR_SHIFT)
    val decodedMessage = decode(encodedMessage, EncoderUtils.getFrequencies)

    EncoderUtils.writeToFile(encodedMessage, Paths.get(EncoderUtils.OUTPUT_PATH, EncoderUtils.CAESAR_ENCODED_OUTPUT_FILE).toFile)
    EncoderUtils.writeToFile(decodedMessage, Paths.get(EncoderUtils.OUTPUT_PATH, EncoderUtils.CAESAR_DECODED_OUTPUT_FILE).toFile)
  }

  def encode(message: String, shift: Int): String = {
    message.map(symbol =>
      if (!symbol.isLetter) symbol
      else if (symbol + shift > EncoderUtils.BOUNDARIES_EN._1) symbol - (EncoderUtils.BOUNDARIES_EN._2 - shift) toChar
      else symbol + shift toChar
    )
  }

  def decode(encodedMessage: String, frequencies: Seq[(Char, Double)]): String = {
    println(countLetters(encodedMessage))

    val actualFrequencies = encodedMessage
      .filter(p => p.isLetter)
      .groupBy(c => c)
      .map(e => e._1 -> EncoderUtils.scale(e._2.length.toDouble / countLetters(encodedMessage).toDouble))

    encodedMessage.map(c =>
      if (c.isLetter) findCharWithClosestFrequency((c, actualFrequencies(c)), frequencies)
      else c
    )
  }

  def countLetters(text: String): Int = {
    text.filter(p => p.isLetter).length
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

}