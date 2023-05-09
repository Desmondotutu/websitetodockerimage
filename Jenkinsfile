pipeline{
	agent any
	  tools {
	    sonarScanner 'SonarScanner';
            dependencyCheck 'Dependency-Check'
	  }
 stages{
   stage('Checkout'){
	    steps{
		echo 'Hello World'
      }
   }
   stage('SonarQube Analysis') {
      steps {
        withSonarQubeEnv('SonarServer') {
          sh "${tool 'SonarScanner'}/bin/sonar-scanner"
        }
      }
    }
     stage('Dependency Check'){
            steps{
                sh "${tool('Dependency-Check')}/bin/dependency-check.sh --scan . --format HTML --project 'WebsiteToDockerImage' --out dependency-check-report.html"
      }
    }

  }

}
