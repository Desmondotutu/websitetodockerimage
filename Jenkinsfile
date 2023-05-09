pipeline{
	agent any
   scannerHome = tool 'sonar-scanner';
	stages{
	  stage('Checkout'){
	    steps{
		echo 'Hello World'
      }
    }
    stage('SonarQube Analysis') {
    
    withSonarQubeEnv('sonar-server') {
      sh "${scannerHome}/bin/sonar-scanner"
    }
  }
	stage('Dependency Check'){
            steps{
                echo 'Hello World'
      }
    }

  }

}
