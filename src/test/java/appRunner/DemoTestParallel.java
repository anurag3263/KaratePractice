package appRunner;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;
import org.apache.commons.io.FileUtils;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

/**
 * @author anuragchaturvedi
 */
public class DemoTestParallel {
	@Test
	void testParallel() {
		Results results = Runner.path("classpath:features").tags("@UI").outputCucumberJson(true).parallel(1);
//		Results results = Runner.path("classpath:features").outputCucumberJson(true).parallel(0);
		generateReport(results.getReportDir());
		assertEquals(0, results.getFailCount(), results.getErrorMessages());
	}

	public static void generateReport(String karateOutputPath) {
		Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
		List<String> jsonPaths = new ArrayList(jsonFiles.size());
		jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
		Configuration config = new Configuration(new File("target"), "Anurag Karate Report");
		ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
		reportBuilder.generateReports();
	}

}