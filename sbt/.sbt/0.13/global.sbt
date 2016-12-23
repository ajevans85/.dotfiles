import org.ensime.EnsimeCoursierKeys._
ensimeServerVersion in ThisBuild := "2.0.0-SNAPSHOT"

// Improved Scala REPL
libraryDependencies += "com.lihaoyi" % "ammonite" % "0.8.0" cross CrossVersion.full
initialCommands in console := """ammonite.Main().run()"""
