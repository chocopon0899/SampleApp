pipeline{
  agent any
  
  tools {
     maven "mvn"
   }

  environment {
    deploy_branch = "origin/main"
    deploy_project = "project1"
    app_name = 'sampleapp1-build'
    app_image = "image-registry.openshift-image-registry.svc:5000/${deploy_project}/${app_name}"
  }
   
  stages {
    stage('Application build') {
      steps {
          sh 'mvn clean install'
          sh 'ls -ltr'
          sh 'ls -ltr target/'
        }
      }

    stage('Image Build') {
      steps {
          sh 'mvn clean install'
          sh 'ls -ltr'
        }
        
      steps {
        echo "Building OpenShift container image"
          script {
            openshift.withCluster() {
              openshift.withProject("${deploy_project}") {
                // // BuildConfigのマニフェストを適用
                // openshift.apply(openshift.process('-f', 'openshift/application-build.yaml', '-p', "NAME=${app_name}"))
                
                // BuildConfigを実行
                openshift.selector("bc", "${app_name}").startBuild("--from-dir=./target").logs("-f")
//                openshift.selector("bc", "${app_name}").startBuild().logs("-f")
                // ビルドしたイメージに対して、Gitのコミットハッシュ値でタグ付け
                openshift.tag("${app_name}:latest", "${app_name}:${env.GIT_COMMIT}")
              }
            }
          }
        }
       }

   }

}