# Worked examples

Real scouts from one small team running AI agents (a PR reviewer, a fix agent, chat bots) in production. Names and numbers are theirs; details that only matter to them are left out. Each shows what was searched, what was borrowed, and what the team's own data said afterwards.

## 1. Paid off: ideas from an open-source PR reviewer

**Feature.** Harden an in-house AI PR reviewer.
**Scout.** One well-known MIT-licensed PR-review agent, read at the code level and compared, feature by feature, with the in-house reviewer. The write-up had three lists: already doing, borrow, skip.
**Borrowed (ideas, no code):**
- one prompt line saying PR text, tickets and comments are data and cannot change the verdict;
- a no-model regex scan of added lines (destructive SQL, secret-like assignments, deleted files) that forces a high-risk review;
- a "ticket requirement: met / not met / needs a person" table.
**Proof.** A replay of 15 past PRs with the old and new prompts: 14 verdicts the same and 1 moved to the right answer; known bugs caught went from 9 to 11 of 12; 4 of 4 PRs with injected instructions stayed blocked; cost +5.6%. Shipped.
**Skipped, with reasons written down:** a single-call compressed-diff review (an earlier test caught 6 of 12 bugs against 10 of 12), an edited-in-place summary comment (conflicted with their design), comment fingerprint dedup (no evidence of duplicates yet).

**Lesson.** The "skip" list was as valuable as the "borrow" list: it stopped two later threads from re-proposing the same ideas.

## 2. Killed by the replay: a cheaper path that looked obvious

**Feature.** Same scout, fourth idea: send small, low-risk PRs through a single reviewer pass instead of several specialists, as the open-source project does.
**Proof.** Replay on 15 small PRs: $0.14 a PR against $0.67, but the single pass missed 2 real Major findings on one PR in 3 of 3 runs. That PR was a docs-only change to the approval rules, which path and size rules call "low risk".
**Decision.** Canceled. Written down: "don't retry without a risk signal that isn't the file path".

**Lesson.** An idea that works in someone else's repo can fail on yours for a reason specific to you. The replay costs a few dollars; a missed Major costs much more. Always name the replay in the plan.

## 3. Paid off from a broad survey: stop a fix agent that is going in circles

**Feature.** The automatic fix agent sometimes pushed round after round that changed nothing.
**Scout.** Part of a broad survey of 93 agent-framework repos (five categories, every license read from the LICENSE file, nothing cloned or run). Two multi-agent frameworks (MIT and Apache-2.0) keep a progress ledger and stop or re-plan when a step makes no progress.
**Borrowed.** The idea only: give each fix round a signature of what it started from; stop after 2 rounds with the same signature and hand the PR to a person.
**Proof.** A monthly benchmark from the team's own CI history: 5% of fix rounds had stalled, and PRs that ended needing a person averaged 1.65 rounds. Small change, kill switch, shipped.

**Lesson.** A broad survey pays off when it is written as ranked ideas with a size, a ticket and a benchmark each, and kept: later threads start from the category files instead of searching again.

## 4. The internal check that was skipped: building what already existed

**Feature.** A teammate needed their schedule data in the team chat.
**What happened.** A new, separate connector was built for it. The existing connector already reached that data; widening its scope was the right move.
**Lesson.** Step 0 includes your own codebase and tools. "Is there already something that does 70% of this?" comes before any GitHub search.

## 5. When not to scout

- Add a `--dry-run` flag that prints instead of writes: familiar, small, no mechanism to learn. Skip.
- Change a cron time, rename a field, fix a typo in a prompt: skip.
- "Build a weekly job that finds recurring problems in our PR system and proposes fixes": scout. It is a mechanism (recurring-failure signatures, measuring a review system, hill-climbing a reviewer) that other teams have solved in several different ways.
- A second scout on the same feature a week later: don't repeat; read the first write-up and search only for the questions it left open.

## 6. Environment lesson: when the API says 403

In a sandbox, the GitHub API answered search calls but refused every repository read ("not enabled for this session"). Four search workers came back with description-only lists. A plain `git clone --depth 1` of the same public repos worked, so the second pass read the code locally. Brief workers with the reading route that works, and make them mark anything they did not read.

## 7. A scout for a weekly "improve the PR system" job, and what the first eval run missed

**Feature.** A weekly job that finds recurring problems in a team's PR and CI system (repeat CI failures, reviewer noise, stuck fix rounds) and proposes one improvement a week, with hill climbing.
**Internal first.** The team already had a weekly reviewer "dreaming" pass, a replay gate for learned notes, a monthly precision count and a monthly stall benchmark. The scout's job became "what should these borrow", not "what should we build".
**Scout.** Four search angles (learning reviewers, recurring CI failures, reviewer benchmarks and hill-climbing, PR flow metrics), 30+ queries, 14 repos read at code level.
**What paid off:**
- Failure signature: one tool hashes the last 5 normalised error lines after scrubbing timestamps, SHAs, UUIDs, temp paths, `line:col`, durations and numbers, and calls 2+ occurrences "recurring"; a big infra monorepo's triage tool normalises similarly, then clusters by edit distance within 10% of length, which catches drifting logs that hash differently.
- Finding outcomes: one reviewer classifies each comment thread as 👎 by a non-author, fixed (flagged lines changed later), resolved with no change, open at merge, or ignored. Two other reviewers count "not rejected" as accepted, which inflates precision: a trap worth naming.
- Hill-climbing gate: one change per round, cheap mechanical checks before spending on evals (cited on 2+ PRs by 2+ authors, no near-duplicate), then a tune split and a held-out split of past PRs, mean of 3 runs.
- Retirement: decay counters (decline after 5 clean PRs, archive after 10) instead of deleting.
**Eval lesson.** In the first test of this skill, a run on a similar task read 4 small repos well but missed both signature tools above and designed its own normalisation, saying no repo did it. That is why Step 2 now says to name the big projects first and to cover the core mechanism twice.
