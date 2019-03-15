Feature: Visitor cannot read restricted articles
	As an Owner
	In order to gain subscribers
	I want to be able to restrict certain content.

	Background:
		Given the following articles exist
			| title                                  | content                                                     | image                                                                 | status     | category |
			| The Hub News is the site of the moment | Great articles! This site's popularity is raising so quick! | https://cdn.pixabay.com/photo/2016/11/29/04/19/beach-1867285__340.jpg | free       | tech     |
			| Spring hasn't arrived in Sweden yet    | Ice can be still spotted on the street, watch out!          | https://cdn.pixabay.com/photo/2016/11/29/04/19/beach-1867285__340.jpg | restricted | sports   |

		And I visit the "landing" page
		Then I should see "Great articles! This site's popularity is raising so quick!" for "The Hub News is the site of the moment"
		And I should see "Ice can be still spotted on the street, watch out!" for "Spring hasn't arrived in Sweden yet"

	Scenario: Visitor can read a free article [Happy Path]
		When I click on "The Hub News is the site of the moment"
		Then I should see "Great articles! This site's popularity is raising so quick!"
		And I should see an article image
		But I should not see "Ice can be still spotted on the street, watch out!"

	Scenario: Visitor cannot read a resctricted article [Sad Path]
		When I click on "Spring hasn't arrived in Sweden yet"
		Then I should be on subscription page
		And I should not see "Ice can be still spotted on the street, watch out!"