Source: https://gist.github.com/ldez/bd6e6401ad0855e6c0de6da19a8c50b5

# Gmail and GitHub

How to filter emails from GitHub in Gmail and flag them with labels.

The labels in this document are just examples.

## Pull Request

| Filter                                                | Label             |
|-------------------------------------------------------|-------------------|
| ```from:(notifications@github.com) subject:"PR \#"``` | `gh-pull-request` |

_Note: special characters like `(` or `#` are ignored and  the escape `\` doesn't work._


## GitHub Actions

| Filter                              | Label |
|-------------------------------------|-------|
| ```from:(ci_activity@github.com)``` | `gha` |


## Discussion

| Filter                                                          | Label           |
|-----------------------------------------------------------------|-----------------|
| ```from:(notifications@github.com) subject:"\(Discussion \#)``` | `gh-discussion` |


## Releases

| Filter                                                                           | Label        |
|----------------------------------------------------------------------------------|--------------|
| ```from:(notifications@github.com) "Visit the release page to download them."``` | `gh-relases` |


## Assignments

| Filter                                                               | Label            |
|----------------------------------------------------------------------|------------------|
| ```from:(notifications@github.com) cc:(assign@noreply.github.com)``` | `gh-assignments` |


## Mentions

| Filter                                                                | Label         |
|-----------------------------------------------------------------------|---------------|
| ```from:(notifications@github.com) cc:(mention@noreply.github.com)``` | `gh-mentions` |


## Review Requested

| Filter                                                                                                    | Label                 |
|-----------------------------------------------------------------------------------------------------------|-----------------------|
| ```from:(notifications@github.com) cc:(review_requested@noreply.github.com) "requested your review on"``` | `gh-review-requested` |


## GitHub emails

- `subscribed`: The notification arrived because you’re watching the repository.
- `manual`: The notification arrived because you’ve specifically decided to subscribe to the thread (via an Issue or Pull Request).
- `author`: The notification arrived because you’ve created the thread.
- `comment`: The notification arrived because you’ve commented on the thread.
- `mention`: The notification arrived because you were specifically @mentioned in the content.
- `team_mention`: The notification arrived because you were on a team that was mentioned (like @org/team).
- `state_change`: The notification arrived because you changed the thread state (like closing an Issue or merging a Pull Request).
- `assign`: The notification arrived because you were assigned to the Issue.
- `review_requested`: The notification arrived because your review is required.
- `ci_activity`: The notification arrived because CI activities (failure, success, ...)
- `push`: The notification arrived because of a push

example:
- mention@noreply.github.com
- assign@noreply.github.com


## Approximate rules

WARNING: Those rules can produce false-positives.

### Closed (~)

label: `gh-closed`

Filter:
```
from:(notifications@github.com) "Closed \#"
```

_Note: special characters like `(` or `#` are ignored and  the escape `\` doesn't work._

### Merged (~)

label: `gh-merged`

Filter:
```
from:(notifications@github.com) "Merged \#"
```

_Note: special characters like `(` or `#` are ignored and  the escape `\` doesn't work._

### Issue (~)

label: `gh-issue`

### since [2021-10-11](https://github.blog/changelog/2021-10-11-improved-notification-email-titles-for-issues-and-prs/)

Filter:
```
from:(notifications@github.com) subject:("Issue \#" -"PR \#")
```

_Note: special characters like `(` or `#` are ignored and  the escape `\` doesn't work._

## References

- http://radek.io/2015/06/07/5-useful-gmail-filters-for-github-users/
- http://lyzidiamond.com/posts/github-notifications-google-script
- http://126kr.com/article/8t3endsbz2q
- https://developer.github.com/v3/activity/notifications/#notification-reasons
- https://support.google.com/mail/answer/7190?hl=en
- https://maximevaillancourt.com/blog/github-email-notifications-gmail-filters
- https://github.blog/changelog/2021-10-11-improved-notification-email-titles-for-issues-and-prs/