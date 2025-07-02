package performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class performanceTest extends Simulation {

  val protocol = karateProtocol(
    "/api/articles/{articleId}" -> Nil
    // "/cats/{id}" -> Nil,
    // "/cats" -> pauseFor("get" -> 15, "post" -> 25)
  )

//   protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
//   protocol.runner.karateEnv("perf")

  val createArticle = scenario("create and delete article").exec(karateFeature("src/test/java/performance/Articles.feature"))
 // val delete = scenario("delete").exec(karateFeature("classpath:mock/cats-delete.feature@name=delete"))

  setUp(
  //  createArticle.inject(rampUsers(10) during (5 seconds)).protocols(protocol),
  //  delete.inject(rampUsers(5) during (5 seconds)).protocols(protocol)
 // createArticle.inject(atOnceUsers(3)).protocols(protocol)
  createArticle.inject(
      atOnceUsers(1),
      nothingFor(4.seconds),
      rampUsers(10).during(5.seconds),
      constantUsersPerSec(20).during(15.seconds),
    //  constantUsersPerSec(20).during(15.seconds).randomized()
      rampUsersPerSec(10).to(20).during(10.seconds),
     // rampUsersPerSec(10).to(20).during(10.seconds).randomized(),
     stressPeakUsers(1000).during(20.seconds)
    ).protocols(protocol)
  )

  // setUp(
  //   createArticle.inject(
  //         atOnceUsers(1),
  //         nothingFor(4 seconds),
  //         constantUsersPerSec(1) during (3 seconds),
  //         constantUsersPerSec(2) during (10 seconds),
  //         rampUsersPerSec(2) to 10 during (20 seconds),
  //         nothingFor(5 seconds),
  //         constantUsersPerSec(1) during (5 seconds)
  //       ).protocols(protocol)
  // )
}