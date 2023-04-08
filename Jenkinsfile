pipeline {
    agent any

 stages {
        stage('git clone') {
            steps {
                git 'https://github.com/adityanaidu20690/Simplest-Spring-Boot-Hello-World.git'
            }
        }
    stage('maven build') {
          steps {
               sh 'mvn clean install test package'
          }
         
        }
         
        stage('upload artifact') {
            steps {
               nexusPublisher nexusInstanceId: 'addydevops', nexusRepositoryId: 'addydevops-release', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: 'war', filePath: 'target/addydevops-1.0.0.war']], mavenCoordinate: [artifactId: 'addydevops', groupId: 'orbartal', packaging: 'war', version: '1.0.0']]]
            }
        }
     stage('sast owasp') {
            steps {
                dependencyCheck additionalArguments: '''--project=pipeline
--scan="/var/lib/jenkins/workspace/pipeline"
--format="XML"''', odcInstallation: 'default'
            }
        }
     
         stage('Downloading from nexus artifact') {
            steps {
            ansiblePlaybook become: true, credentialsId: 'ansible', disableHostKeyChecking: true, installation: 'ansible', inventory: '/etc/ansible/hosts', playbook: '/etc/ansible/play.yml' 
           }
        }
      stage('docker run') {
            steps {
               sh '''
docker build -t addytest .
docker run -d -it --name addytest -p 8082:8080 addytest'''
            }
        }
     stage('publish the report') {
            steps {
               dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }
    }
}
