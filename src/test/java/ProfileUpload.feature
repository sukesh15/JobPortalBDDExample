Feature: As an existing job portal user
  I want to be able to upload audio and video versions of my profile
  So that prospective employers can view the same


  @ProfileUpload
  Scenario: Upload an audio and video profile
    Given I am logged into the Job Portal
    When I search for my profile
    And I choose to upload a saved audio profile

    Then the audio profile should get uploaded

    When I choose to upload a saved video profile
    Then the video profile should get uploaded