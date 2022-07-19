/**
 * This is much smaller and faster than the lodash-es version.
 */
function cloneDeep<T>(obj: T): T {
  return JSON.parse(JSON.stringify(obj));
}

export default cloneDeep;
