import Util._

ThisBuild / shellPrompt := { state => s"${prompt(projectName(state))}> " }
