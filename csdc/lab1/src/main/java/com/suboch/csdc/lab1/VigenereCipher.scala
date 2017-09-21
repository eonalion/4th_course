package com.suboch.csdc.lab1

import java.nio.file.Paths

import scala.io.Source

object VigenereCipher {
  val KEY = "DOCUMENT"

  def main(args: Array[String]): Unit = {
    val message = Source.fromResource(EncoderUtils.VIGENERE_INPUT_PATH).getLines().mkString.toUpperCase
    val encodedMessage = encode(message.toUpperCase, KEY)

    val decodedKey = decode(encodedMessage)
    println(decodedKey)

    EncoderUtils.writeToFile(encodedMessage, Paths.get(EncoderUtils.OUTPUT_PATH, EncoderUtils.VIGENERE_ENCODED_OUTPUT_FILE).toFile)
  }

  def encode(text: String, key: String): String = {
    var textPosition = 0
    var keyPosition = 0
    var res = ' '

    text.map(symbol => {
      keyPosition = keyPosition % key.length

      if (!symbol.isLetter)
        res = symbol
      else {
        val keyChar = key.charAt(keyPosition)
        val textChar = text.charAt(textPosition)
        res = keyChar + (textChar - EncoderUtils.BOUNDARIES_EN._3) toChar

        if (res > EncoderUtils.BOUNDARIES_EN._1)
          res = EncoderUtils.BOUNDARIES_EN._3 + (res - EncoderUtils.BOUNDARIES_EN._1 - 1) toChar

        keyPosition += 1
      }

      textPosition += 1
      res
    })
  }

  def decode(encodedMessage: String): String = {
    val filteredText = encodedMessage.filter(p => p.isLetter)
    println(filteredText.length)
    val destinations = findDestinationsBetweenRepeatedSubsequences(filteredText)
    val filteredDestinations = filterDestinations(destinations)
    val keyLength = calculateGCD(filteredDestinations)

    val encodedStringsArray = Array.fill(keyLength)("")
    val decodedStringsArray = Array.fill(keyLength)("")
    var key = ""

    for (i <- 0 until filteredText.length) {
      val index = i % keyLength
      encodedStringsArray(index) += filteredText.charAt(i)
    }

    for (i <- 0 until keyLength) {
      decodedStringsArray(i) = decodeCaesarCipher(encodedStringsArray(i))
      val keyChar = (EncoderUtils.BOUNDARIES_EN._3 + Math.abs(filteredText.charAt(i) - decodedStringsArray(i).charAt(0))).toChar
      key += keyChar
    }

    key
  }

  def decodeCaesarCipher(text: String): String = {
    val freqChar = findTheMostFrequentChar(text)
    val shift = freqChar - 'E'

    var decodedString = ""
    for (i <- 0 until text.length) decodedString += text.charAt(i) - shift

    CaesarCipher.encode(text, shift)
  }

  def findTheMostFrequentChar(text: String): Char = {
    val actualFrequencies = text
      .filter(p => p.isLetter)
      .groupBy(c => c)
      .map(e => e._1 -> e._2.length)

    actualFrequencies.maxBy(_._2)._1
  }

  def findDestinationsBetweenRepeatedSubsequences(text: String): collection.mutable.Map[Int, Int] = {
    val pattern = """(?=([a-zA-Z]{3}).*\1+)""".r
    var subsequences = Set[String]()
    val destinationsMap = collection.mutable.Map[Int, Int]().withDefaultValue(0)

    pattern.findAllIn(text).matchData.foreach { m => subsequences += m.group(1) }

    subsequences.foreach(p => {
      var oldIndex = text.indexOf(p)
      while (oldIndex >= 0) {
        val newIndex = text.indexOf(p, oldIndex + p.length)
        if (newIndex >= 0) {
          destinationsMap(newIndex - oldIndex) += 1
        }
        oldIndex = newIndex
      }
    })

    destinationsMap
  }

  def filterDestinations(destinations: collection.mutable.Map[Int, Int]): Seq[Int] = {
    destinations.filter(p => p._2 > 3).keys.toSeq
  }

  def calculateGCD(destination: Seq[Int]): Int = {
    var result = destination.head
    for (i <- destination.indices) {
      val tempGDC = gcd(result, destination(i))

      // Filter gdc with assumption that key length > 2
      if (tempGDC > 4) {
        result = tempGDC
      }
    }
    result
  }

  def gcd(a: Int, b: Int): Int = {
    if (b == 0) a else gcd(b, a % b)
  }

}