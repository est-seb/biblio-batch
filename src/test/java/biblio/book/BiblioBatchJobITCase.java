package biblio.book;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.JobParametersBuilder;
import org.springframework.batch.test.JobLauncherTestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.concurrent.ThreadLocalRandom;

/**
 * Created by heroinedor on 12/07/2017.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:context-test.xml", "classpath:jobs/biblioBatchJob.xml", "classpath:jobs/folderScannerJob.xml"})
public class BiblioBatchJobITCase {

    @Autowired
    private JobLauncherTestUtils jobLauncherBiblio;

    @Test
    public void testJob() throws Exception {

        JobParameters jobParameters =
                new JobParametersBuilder().addString("fileName", "file:C:/temp/books/lorem-ipsum.txt")
                        .addLong("random", ThreadLocalRandom.current().nextLong(1000000L)).toJobParameters();

        JobExecution jobExecution = jobLauncherBiblio.launchJob(jobParameters);

        Assert.assertEquals("COMPLETED", jobExecution.getExitStatus().getExitCode());
    }
}