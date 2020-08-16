pipeline {
  environment {
    registry = "sivaramloknath64/angular"
    registryCredential = 'docker_hub_loknath'
    dockerImage = ''
  }
agent any  
stages {

   stage('npm install package'){
                steps{
                    sh label: '', script: '''
                         npm install 
                     '''
                     echo 'npm installed successfully'
                    }
            }
                stage('Build'){
                    steps{
                      
                        sh 'npm run build --prod'  
                    }
                }
      
   stage ('Build Docker Image') {
      steps{
        echo "Building Docker Image"
   
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      
      }
    }

  
  stage ('Push Docker Image') {
      steps{
        echo "Pushing Docker Image"
        script {
          docker.withRegistry( '', registryCredential ) {
              dockerImage.push()
              dockerImage.push('latest')
          }
        }
      }
    }
  
  
    stage ('Deploy to dev Environment') {
      steps{
        echo "deploying to dev environment"
        
     sh "docker rm -f angulardemo || true"
     sh " docker run -d --name=angulardemo -p 8082:80 sivaramloknath64/angular"     
              
        
        }
      }

   
  
}
}
