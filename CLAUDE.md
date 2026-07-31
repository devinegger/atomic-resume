# CLAUDE.md

**Read [`AGENTS.md`](AGENTS.md) first.** It holds the operating instructions for this repo — the loop, how to work with the person, the truthfulness contract, and the anti-patterns. Everything below is Claude-specific and assumes you've read it.

## Claude-specific notes

**Skills are plain markdown, not auto-loaded.** The files in `skills/` are procedures written for any agent. Read the relevant one before starting a task — `skills/README.md` is the index. They are not Claude Skills and nothing invokes them automatically.

**Use your file tools directly.** Read, write, and organize files yourself rather than telling the person to do it. The one thing they do by hand is putting source material into `_inbox/`.

**Don't fetch a posting URL without asking.** Some job boards block automated fetches and some are behind a login. Ask first, and if a fetch fails, have them paste the text or save it into `_inbox/` — that's a normal path, not a failure.

**Keep responses short in this repo.** The person is reading in a terminal or a chat pane while thinking about their own career. One idea, one question, one proposed next step per turn.

**Long documents go to files, not into chat.** Write the draft, then tell them which file to open.

## If you're running as Claude Code

The kickoff prompt in [`README.md`](README.md) works from a fresh session in this directory. Nothing needs installing and there is no build step.

If `profile/` contains only `README.md`, this is a first run — start at [`skills/first-run.md`](skills/first-run.md) rather than asking what they'd like to do.
