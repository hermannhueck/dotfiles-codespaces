/*
// integrate ammonite into sbt
//
libraryDependencies += "com.lihaoyi" % "ammonite" % "1.6.9" % "test" cross CrossVersion.full

// sbt 1.x
Test / sourceGenerators += Def.task {
  val file = (Test / sourceManaged).value / "amm.scala"
  IO.write(file, """object amm extends App { ammonite.Main.main(args) }""")
  Seq(file)
}.taskValue

addCommandAlias("amm", "Test/runMain amm")
 */

/*
// sbt 0.13.x
sourceGenerators in Test += Def.task {
  val file = (sourceManaged in Test).value / "amm.scala"
  IO.write(file, """object amm extends App { ammonite.Main.main(args) }""")
  Seq(file)
}.taskValue
 */
