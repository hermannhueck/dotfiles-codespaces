// make sbt tasks cancelable
Global / cancelable := true

// auto start sbt language server
// autoStartServer := false // default: true

// since sbt 1.3.0
//
// use coursier instead of ivy for LM
ThisBuild / useCoursier := true            // default: true
// super shell
ThisBuild / useSuperShell := true          // default: true
// turbo mode with ClassLoader layering
ThisBuild / turbo := true                  // default: false
// build definition source watch
Global / onChangedBuildSource := ReloadOnSourceChanges
// include resolvers from the metabuild
ThisBuild / includePluginResolvers := true // default: false

// SemanticDB support
// sbt 1.3.x makes it easier to generate SemanticDB. To enable the generation of SemanticDB build-wide:
// ThisBuild / semanticdbEnabled := false // default: false
// ThisBuild / semanticdbVersion := "4.2.4"
// ThisBuild / semanticdbIncludeInJar := false // default: false

// neme - not exhaustive match error
// https://github.com/softwaremill/neme-plugin
// addCompilerPlugin("com.softwaremill.neme" %% "neme-plugin" % "0.0.3")

// ThisBuild / watchBeforeCommand := Watch.clearScreen
// ThisBuild / watchTriggeredMessage := Watch.clearScreenOnTrigger
// ThisBuild / watchForceTriggerOnAnyChange := true

// Test / parallelExecution := false
// Test / turbo := true
// D - show all durations, S - show short stack traces
Test / testOptions += Tests.Argument(TestFrameworks.ScalaTest, "-oSD")
// run 100 tests for each property // -s = -minSuccessfulTests
Test / testOptions += Tests.Argument(TestFrameworks.ScalaCheck, "-s", "100")
