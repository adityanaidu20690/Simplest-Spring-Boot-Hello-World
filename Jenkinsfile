pipeline {
    agent any

 stages {
        stage('git clone') {
            steps {
                git 'https://github.com/adityanaidu20690/Simplest-Spring-Boot-Hello-World.git'
            }
        }
    stage('maven clean') {
          steps {
               sh 'mvn clean '
          }
         
        }
    stage('maven install') {
          steps {
               sh 'mvn install'
          }
         
        }
        stage('maven test') {
          steps {
               sh 'mvn test'
          }
         
        }
       stage('maven package') {
          steps {
               sh 'mvn package'
          }
         
        }
      
        stage('upload artifact') {
            steps {
                nexusPublisher nexusInstanceId: 'addydevops', nexusRepositoryId: 'addy-release', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '\'\'', extension: 'war', filePath: 'target/addydevops-1.0.0-SNAPSHOT.war']], mavenCoordinate: [artifactId: 'addydevops', groupId: 'orbartal', packaging: 'war', version: '1.0.0']]]
            }
        }
    }
}
