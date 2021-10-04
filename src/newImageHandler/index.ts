import { BucketFunctionTrigger, FunctionContext } from '../types';

import { Datastore } from '@google-cloud/datastore';
import { Kinds } from '../shared/datastore';

export const main = async (file: BucketFunctionTrigger): Promise<void> => {
    const datastore = new Datastore();
    const kind = Kinds.DOCUMENTS_FOR_DELETION;

    // The name/ID for the new entity
    const name = file.id;
    // The Cloud Datastore key for the new entity
    const taskKey = datastore.key([kind, name]);

    // Prepares the new entity
    const task = {
        key: taskKey,
        data: {
            timeCreated: file.timeCreated,
        },
    };

    // Saves the entity
    await datastore.save(task);
};
