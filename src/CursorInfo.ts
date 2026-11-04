/**
 * A copy of `diff.CursorInfo` from fast-diff 1.3.0 (`diff.d.ts`): the cursor
 * argument of `Delta#diff()`.
 *
 * fast-diff is bundled into dist, so it is only a devDependency. Importing its
 * type instead would put `import diff from 'fast-diff'` in the published
 * declarations, which consumers without fast-diff installed can't resolve.
 */
interface CursorInfo {
  oldRange: { index: number; length: number };
  newRange: { index: number; length: number };
}

export default CursorInfo;
