pipeline {
  agent any
  stages {
    stage('SonarQube Analysis') {
      steps {
        script {
          scannerHome = tool 'SonarQube Scanner'
        }
        withSonarQubeEnv('SonarQube') {
          sh "${scannerHome}/bin/sonar-scanner sonar.projectKey=test"
        }
      }
    }
    stage('Maven Build') {
      steps {
        echo 'start maven compile'
        sh 'mvn -Dmaven.test.skip=true -U clean install'
      }
    }
    stage('Docker Build') {
      steps {
        echo 'start build image'
      }
    }
    stage('Start Service') {
      steps {
        echo 'start demo'
      }
    }
  }
  environment {
    REPOSITORY = 'https://github.com/YuGanRepo/jenkins-test.git'
  }
}
