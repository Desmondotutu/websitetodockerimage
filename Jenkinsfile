pipeline {
    agent any
    environment {
        scannerHome = tool 'SonarQubeScanner5.0'
        DependencyCheck = tool 'DP-Check'
    }
    stages {

      stage('Dependency Test') {
            steps {
                sh "${DependencyCheck}/bin/dependency-check.sh --scan . --out dependency-check-report.html"
            }
        }
      stage('Static Code Analysis') {
            steps {
                scripts{
                withSonarQubeEnv('SonarqubeServer10'){
                    sh "${scannerHome}/bin/sonar-scanner"
                }
                }
            }
        }
    }
}
