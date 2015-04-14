name := """play-admin"""

version := "1.0-SNAPSHOT"

scalaVersion := "2.11.1"

libraryDependencies += filters

libraryDependencies ++= Seq(
  javaJdbc,
  javaEbean,
  cache,
  javaWs
)

//Webjars
libraryDependencies ++= Seq(
  "org.webjars" %% "webjars-play" % "2.3.0-2",
  "org.webjars" % "jquery" % "1.11.1",
  "org.webjars" % "angularjs" % "1.3.15",
  "org.webjars" % "angularAMD" % "0.2.1-1",
  "org.webjars" % "angular-ui" % "0.4.0-3",
  "org.webjars" % "angular-ui-router" % "0.2.13",
  "org.webjars" % "ui-router-extras" % "0.0.13",
  "org.webjars" % "bootswatch-paper" % "3.3.1+2",
  "org.webjars" % "angular-schema-form" % "0.7.3-1",
  "org.webjars" % "bootstrap" % "3.1.1-1",
  "org.webjars" % "requirejs-text" % "2.0.10-3"
)

LessKeys.compress in Assets := true

pipelineStages := Seq(rjs, uglify, digest, gzip)

includeFilter in uglify := GlobFilter("javascript/*.js")

includeFilter in (Assets, LessKeys.less) := "*.less"

lazy val root = (project in file(".")).enablePlugins(PlayJava).enablePlugins(SbtWeb)

