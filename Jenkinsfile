pipeline{
  agent any
  
  tools {
     maven "mvn"
   }

  environment {
    deploy_project = "project1"
    app_name = 'sampleapp1-build'
  }
   
  stages {
    stage('Application build') {
      steps {
          sh 'mvn clean install'
          stash includes: "target/SampleApp.war", name: "war"
        }
      }

    stage('Image Build') {
      steps {
        echo "Building OpenShift container image"
        unstash "war"
        script {
          openshift.withCluster() {
            openshift.withProject("${deploy_project}") {
            // // BuildConfigのマニフェストを適用
            openshift.apply('-f', 'openshift/sampleapp_build.yml')
                
            // BuildConfigを実行
            openshift.selector("bc", "${app_name}").startBuild("--from-file=./target/SampleApp.war").logs("-f")
              }
            }
          }
        }
      }

    stage('Application deploy') {
      steps {
        echo "deploy"
          script {
            openshift.withCluster() {
              openshift.withProject("${deploy_project}") {
                // アプリケーションマニフェストを適用（デプロイ）
                openshift.apply('-f', 'argocd/sampleapp.yml')

              }
            }
          }
        }
      }
  }
}