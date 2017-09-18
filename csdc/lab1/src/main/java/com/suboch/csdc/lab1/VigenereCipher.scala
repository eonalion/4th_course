package com.suboch.csdc.lab1

import java.io.{BufferedWriter, FileWriter}
import java.nio.file.{Files, Paths}

import scala.io.Source

object VigenereCipher {

  var boundaries = EncoderUtils.BOUNDARIES_EN

  def main(args: Array[String]): Unit = {
    val language = args(0)
    val key = args(1).toUpperCase()
    boundaries = EncoderUtils.setBoundaries(language)

    val message = Source.fromResource(EncoderUtils.VIGENERE_INPUT_PATH).getLines().mkString.toUpperCase
    val encodedMessage = encode(message.toUpperCase, key)
    val decodedKey = decode(encodedMessage)

    println(decodedKey)

    if (!Files.exists(Paths.get(EncoderUtils.OUTPUT_PATH))) {
      Files.createDirectory(Paths.get(EncoderUtils.OUTPUT_PATH))
    }

    val bw = new BufferedWriter(new FileWriter(Paths.get(EncoderUtils.OUTPUT_PATH, EncoderUtils.VIGENERE_ENCODED_OUTPUT_FILE).toFile))
    bw.write(encodedMessage)
    bw.close()
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

  def decode(encodedMessage: String): String = {
    val destinations = findDestinationsBetweenRepeatedSubsequences(encodedMessage)
    val filteredDestinations = filterDestinations(destinations)
    val keyLength = calculateGCD(filteredDestinations)

    val encodedStringsArray = Array.fill(keyLength)("")
    val decodedStringsArray = Array.fill(keyLength)("")
    var key = ""

    for (i <- 0 until encodedMessage.length) {
      val index = i % keyLength
      encodedStringsArray(index) += encodedMessage.charAt(i)
    }

    CaesarCipher.boundaries = EncoderUtils.setBoundaries("en")
    for (i <- 0 until keyLength) {
      decodedStringsArray(i) = CaesarCipher.decode(encodedStringsArray(i), CaesarCipher.getFrequencies)
      //TODO: Fix (if first is not letter)
      val keyChar = (boundaries._3 + Math.abs(encodedMessage.charAt(i) - decodedStringsArray(i).charAt(0))).toChar
      key += keyChar
    }

    key
  }

  def findDestinationsBetweenRepeatedSubsequences(text: String): collection.mutable.Map[Int, Int] = {
    val pattern = """(?=([a-zA-Z]{3}).*\1+)""".r
    var subsequences = Set[String]()
    val destinationsMap = collection.mutable.Map[Int, Int]().withDefaultValue(0)

    pattern.findAllIn(text).matchData foreach {
      m => subsequences += m.group(1)
    }

    subsequences.foreach(p => {
      var oldIndex = text.indexOf(p)
      while (oldIndex >= 0) {
        val newIndex = text.indexOf(p, oldIndex + p.length)
        if (newIndex >= 0) {
          val currentIndex = newIndex - oldIndex
          destinationsMap(currentIndex) += 1
        }
        oldIndex = newIndex
      }
    })

    destinationsMap
  }

  def filterDestinations(destinations: collection.mutable.Map[Int, Int]): Seq[Int] = {
    destinations.filter(p => p._2 > 1).keys.toSeq
  }

  def calculateGCD(destination: Seq[Int]): Int = {
    var result = destination.head
    for (i <- destination.indices) {
      result = gcd(result, destination(i))

      // Filter gdc with assumption that key length > 2
      /* if (tempGDC > 2) {
         result = tempGDC
       }*/
    }
    result
  }

  def gcd(a: Int, b: Int): Int = {
    if (b == 0) a else gcd(b, a % b)
  }

}