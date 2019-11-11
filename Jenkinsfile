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
          $(npm bin)/ng test --single-run --browsers Chrome_no_sandbox
        '''
      }
      post {
          always {
            junit "test-results.xml"
          }
      }
    }
    stage ('Code quality'){
      steps{
        sh '$(npm bin)/ng lint'
      }
    }
    stage ('Build') {
      steps{
        sh '$(npm bin)/ng build --prod --build-optimizer'
      }
    }
  }
}
