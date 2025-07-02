package appRunner;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

/**
 * @author anuragchaturvedi
 */
public class DemoParallelTest {

	/**
	 * To run Then test From command line use below command where -Dtest= classname
	 * where you have created your parallel runner class 
	 * use --tags if you want run any specific feature / scenario 
	 * mvn test "-Dkarate.options=--tags ~@skipme" -Dtest=DemoTestParallel
	 * if you want to run all the feature except on then mention it like ~@skipme
	 * if you want to run single scenario then use like below
	 * mvn test "-Dkarate.options=--tags @SetValue" -Dtest=DemoTestParallel
	 * but to run the the test through command / terminal add maven-surefire-plugin first
	 */

	@Test
	void testParallel() {
		Results results = Runner.path("classpath:features").tags("@conduit").outputCucumberJson(true).parallel(1);
//		Results results = Runner.path("classpath:features").outputCucumberJson(true).parallel(0);
		generateReport(results.getReportDir());
		assertEquals(0, results.getFailCount(), results.getErrorMessages());
	}

	public static void generateReport(String karateOutputPath) {
		Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
		List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
		jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
		Configuration config = new Configuration(new File("target"), "Anurag Karate Report");
		ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
		reportBuilder.generateReports();
	}

}