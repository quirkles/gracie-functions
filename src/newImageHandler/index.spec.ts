import { main } from './index';

const file = {
    bucket: 'gracie_images',
    contentType: 'application/octet-stream',
    crc32c: '1A4RwA==',
    etag: 'CKT27f6xr/MCEAE=',
    generation: '1633303582702372',
    id: 'gracie_images/test/Screen Shot 2021-10-02 at 8.00.11 PM.png/1633303582702372',
    kind: 'storage#object',
    md5Hash: 'Q74/kaj1VieIMmSH9OHclg==',
    mediaLink:
        'https://www.googleapis.com/download/storage/v1/b/gracie_images/o/test%2FScreen%20Shot%202021-10-02%20at%208.00.11%20PM.png?generation=1633303582702372&alt=media',
    metageneration: '1',
    name: 'test/Screen Shot 2021-10-02 at 8.00.11 PM.png',
    selfLink:
        'https://www.googleapis.com/storage/v1/b/gracie_images/o/test%2FScreen%20Shot%202021-10-02%20at%208.00.11%20PM.png',
    size: '4263',
    storageClass: 'STANDARD',
    timeCreated: '2021-10-03T23:26:22.766Z',
    timeStorageClassUpdated: '2021-10-03T23:26:22.766Z',
    updated: '2021-10-03T23:26:22.766Z',
};
const context = {
    eventId: '3170184263873009',
    eventType: 'google.storage.object.finalize',
    resource: {
        name: 'projects/_/buckets/gracie_images/objects/test/Screen Shot 2021-10-02 at 8.00.11 PM.png',
        service: 'storage.googleapis.com',
        type: 'storage#object',
    },
    timestamp: '2021-10-03T23:26:23.026Z',
};

describe('new image handler', () => {
    it('works', () => {
        expect(() => main(file)).not.toThrow();
    });
});
