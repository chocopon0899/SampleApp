pipeline{
  agent any
  
  tools {
     maven "mvn"
   }
   
  stages {
    stage('Application build') {
      steps {
          sh 'mvn --version'
        }
      }
    }
}