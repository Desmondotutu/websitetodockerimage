pipeline{
	agent any
	  tools {
	    sonarScanner 'sonar-scanner'
            dpc 'dp'
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
                echo 'Hello World'
      }
    }

  }

}
