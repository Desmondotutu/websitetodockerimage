pipeline{
	agent any
	  tools {
	    SonarScanner 'sonar-scanner';
            Dependency-Check 'dependency-check'
	  }
 stages{
   stage('Checkout'){
	    steps{
		echo 'Hello World'
      }
   }
   stage('SonarQube Analysis') {
      steps {
        withSonarQubeEnv('sonar-server') {
          sh "${tool 'sonar-scanner'}/bin/sonar-scanner"
        }
      }
    }
     stage('Dependency Check'){
            steps{
                sh "${tool('dependency-check')}/bin/dependency-check.sh --scan . --format HTML --project 'MyProject' --out dependency-check-report.html"
      }
    }

  }

}
