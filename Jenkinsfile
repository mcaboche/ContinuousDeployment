pipeline{
    agent {
        label 'master'
    }
  stages{
    stage ('Checkout'){
      steps{
        checkout scm
      }
    }
    stage ('Install node modules'){
      steps{
        sh '''
          npm install --verbose -d
        '''
      }
    }
    stage ('Test'){
      steps{
        sh '''
          npm test
        '''
      }
      post {
          always {
            junit "test-results.xml"
          }
      }
    }
    stage ('Build') {
      steps{
        sh 'npm run-script build'
      }
    }

    stage ('Deployment') {
      steps{
        sh ("chmod +x ./deployment.sh")
        sh ('./deployment.sh ' + env.BRANCH_NAME)
      }
    }
  }
}
