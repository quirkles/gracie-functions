export interface BucketFunctionTrigger {
    bucket: string;
    contentType: string;
    crc32c: string;
    etag: string;
    generation: string;
    id: string;
    kind: string;
    md5Hash: string;
    mediaLink: string;
    metageneration: string;
    name: string;
    selfLink: string;
    size: string;
    storageClass: string;
    timeCreated: string;
    timeStorageClassUpdated: string;
    updated: string;
}
export interface FunctionContext {
    eventId: string;
    eventType: string;
    resource: {
        name: string;
        service: string;
        type: string;
    };
    timestamp: string;
}
