// Use of this source code is governed by the Apache License, Version 2.0 
// that can be found in the LICENSE file.

const async = require('async');
const { assertFails, assertSucceeds } = require("@firebase/rules-unit-testing");
const {
  setupTestDatabaseWith,
  getApplicationWith,
  tearDown,
} = require("./test_utils/test-app-utils");
const {
  allowedEmailDomains, getAllowedEmailUser, passwordSignInProviderId,
  getDeniedEmailUser, googleSignInProviderId, tasks, getTask
} = require("./test_utils/test-data");

describe("", async () => {
  const collection = "tasks";

  const usersPermissions = [
    {
      'describe': 'Authenticated with a password and allowed email domain user with a verified email',
      'app': await getApplicationWith(
        getAllowedEmailUser(passwordSignInProviderId, true)
      ),
      'can': {
        'create': false,
        'read': false,
        'update': false,
        'delete': false,
      }
    },
    {
      'describe': 'Authenticated with a password and not allowed email domain user with a verified email',
      'app': await getApplicationWith(
        getDeniedEmailUser(passwordSignInProviderId, true)
      ),
      'can': {
        'create': false,
        'read': false,
        'update': false,
        'delete': false,
      }
    },
    {
      'describe': 'Authenticated with a password and allowed email domain user with not verified email',
      'app': await getApplicationWith(
        getAllowedEmailUser(passwordSignInProviderId, false)
      ),
      'can': {
        'create': false,
        'read': false,
        'update': false,
        'delete': false,
      }
    },
    {
      'describe': 'Authenticated with a password and not allowed email domain user with not verified email',
      'app': await getApplicationWith(
        getDeniedEmailUser(passwordSignInProviderId, false)
      ),
      'can': {
        'create': false,
        'read': false,
        'update': false,
        'delete': false,
      }
    },
    {
      'describe': 'Authenticated with google and allowed email domain user with a verified email',
      'app': await getApplicationWith(
        getAllowedEmailUser(googleSignInProviderId, true)
      ),
      'can': {
        'create': false,
        'read': false,
        'update': false,
        'delete': false,
      }
    },
    {
      'describe': 'Authenticated with google and not allowed email domain user with a verified email',
      'app': await getApplicationWith(
        getDeniedEmailUser(googleSignInProviderId, true)
      ),
      'can': {
        'create': false,
        'read': false,
        'update': false,
        'delete': false,
      }
    },
    {
      'describe': 'Authenticated with google and allowed email domain user with not verified email',
      'app': await getApplicationWith(
        getAllowedEmailUser(googleSignInProviderId, false)
      ),
      'can': {
        'create': false,
        'read': false,
        'update': false,
        'delete': false,
      }
    },
    {
      'describe': 'Authenticated with google and not allowed email domain user with not verified email',
      'app': await getApplicationWith(
        getDeniedEmailUser(googleSignInProviderId, false)
      ),
      'can': {
        'create': false,
        'read': false,
        'update': false,
        'delete': false,
      }
    },
    {
      'describe': 'Unauthenticated user',
      'app': await getApplicationWith(null),
      'can': {
        'create': false,
        'read': false,
        'update': false,
        'delete': false,
      }
    },
  ];

  before(async () => {
    await setupTestDatabaseWith(Object.assign({}, tasks, allowedEmailDomains));
  });

  describe("Tasks collection rules", () => {
    async.forEach(usersPermissions, (user, callback) => {
      describe(user.describe, function () {
        let canCreateDescription = user.can.create ?
          "allows creating a task" :
          "does not allow creating a task";
        let canReadDescription = user.can.read ?
          "allows reading tasks" :
          "does not allow reading tasks";
        let canUpdateDescription = user.can.update ?
          "allows updating a task" :
          "does not allow updating a task";
        let canDeleteDescription = user.can.delete ?
          "allows deleting a task" :
          "does not allow deleting a task";

        it(canCreateDescription, async () => {
          const createPromise = user.app.collection(collection).add(getTask());

          if (user.can.create) {
            await assertSucceeds(createPromise)
          } else {
            await assertFails(createPromise)
          }
        });

        it(canReadDescription, async () => {
          const readPromise = user.app.collection(collection).get();

          if (user.can.read) {
            await assertSucceeds(readPromise)
          } else {
            await assertFails(readPromise)
          }
        });

        it(canUpdateDescription, async () => {
          const updatePromise = user.app
            .collection(collection)
            .doc("1")
            .update({ context: "updated" });

          if (user.can.update) {
            await assertSucceeds(updatePromise)
          } else {
            await assertFails(updatePromise)
          }
        });

        it(canDeleteDescription, async () => {
          const deletePromise =
            user.app.collection(collection).doc("1").delete();

          if (user.can.delete) {
            await assertSucceeds(deletePromise)
          } else {
            await assertFails(deletePromise)
          }
        });
      });
      callback();
    });
  });

  after(async () => {
    await tearDown();
  });
});
