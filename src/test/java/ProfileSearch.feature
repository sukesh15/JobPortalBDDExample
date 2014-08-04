Feature:
  As a Job Portal User
  I want to be able to search for profiles based on certain categories
  So that i can view the profile in audio and video formats


  @Search_Based_On_A_Single_Category
  Scenario: Search for a candidate based on experience
    Given I am logged into the Job Portal

    When I search for profiles based on experience
    And I enter the required experience as "10" years

    Then I should see all profiles with experience equal or greater than "10" years
    When I select any of the available profiles

    Then I should be able to see a video profile of the candidate
    And I should be able to see an audio profile of the candidate


  @Data_Drive_Search_Based_On_Experience
  Scenario Outline: Data driven scenario of searching for a candidate based on experience
    Given I am logged into the Job Portal

    When I search for profiles based on experience
    And I enter the required experience as <numberOfYears> years

    Then I should see all profiles with experience equal or greater than <numberOfYears> years
    When I select any of the available profiles

    Then I should be able to see a video profile of the candidate
    And I should be able to see an audio profile of the candidate

  Examples:
    | numberOfYears |
    | 10            |
    | 15            |


  @Search_Based_On_Multiple_Parameters
  Scenario: Search for a candidate based on a combination of parameters
    Given I am logged into the Job Portal

    When I search for a profile based on the following criteria:
      | experience | technology | location | domain        |
      | 10         | JAVA       | BDD      | NotApplicable |

    Then I should see matching profile

    When I Select any of the matching profile
    Then I should be able to see a video profile of the candidate, if available
    And I should be able to see an audio profile of the candidate, if available

  @Search_Results_Sorted_By_Video_Audio_Availability
  Scenario: Search results prioritized based on existing video and audio profile
    Given I am logged into the Job Portal

    When I search for a profile based on the following criteria:
      | experience | technology | location | domain        |
      | 10         | JAVA       | BDD      | NotApplicable |

    Then I should see matching profile
    And the search results should be sorted by audio and video profiles availability
