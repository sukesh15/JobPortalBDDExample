Feature: As a job portal user
  I want to be able to create my profile and upload audio and video versions of my profile
  So that prospective employers can view the same

  @ProfileCreation
  Scenario: Create a new profile
    Given I am logged into the Job Portal
    When I choose to create a profile
    Then I am allowed to enter details of my profile

    When I enter the mandatory profile details as following:
      | firstName | lastName | experience | technology |
      | Sukesh    | Kumar    | 10         | JAVA       |
    And i choose to confirm the details

    Then my profile should be created
    And I should be able to search for my profile

  @ProfileUpload
  Scenario: Upload an audio and video profile
    Given I am logged into the Job Portal
    When I search for my profile
    And I choose to upload a saved audio profile

    Then the audio profile should get uploaded

    When I choose to upload a saved video profile
    Then the video profile should get uploaded