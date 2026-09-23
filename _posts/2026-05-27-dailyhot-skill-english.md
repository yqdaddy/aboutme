---
layout: post
title: "Tired of Checking 10 Apps for Trending Topics? I Built a Tool That Searches 56 Platforms in One Sentence"
date: 2026-05-27
categories: [AI]
---

# Tired of Checking 10 Apps for Trending Topics? I Built a Tool That Searches 56 Platforms in One Sentence

> "I've always been suspicious of 'fragmented reading' — and for good reason."

Here's a scenario you probably live through every single day.

You open your eyes in the morning. First thing: check Weibo's trending topics.

Second thing: check Zhihu's hot list. Third thing: check 36Kr's morning briefing. Fourth thing: check Bilibili's trending. Fifth thing: check GitHub Trending. Sixth thing…

By the time you finish this loop, an hour has vanished. You didn't catch any real trends, but your anxiety is through the roof.

You can't sleep. You stare at all these apps half the night, and slowly the truth sinks in. They all say the same thing: **duplication**.

You saw the same news on Weibo, then again on Zhihu, then pushed to you by Toutiao. You're wasting your time "scrolling" instead of "writing."

And here's the worst part: 80% of these trends have nothing to do with the field you actually care about. Out of Weibo's Top 50, maybe 3 are tech-related. Zhihu's Top 10 is all entertainment gossip and sports.

You spent an hour bouncing between a dozen platforms and found exactly one usable topic.

**This isn't chasing trends. This is panning for gold in a landfill. And the saddest part? You do it every single day without ever asking why.**

---

## No Good Wheel? Build Your Own

When there's no off-the-shelf tool, you make one.

That's the first rule content creators should learn — and the one we most often forget, because we're so used to solving things "by hand" that we forget to solve them "with tools."

So I built a Claude Code Skill called **DailyHot**.

What does it do? One sentence to query trending topics from **56+ Chinese content platforms**.

Weibo, Zhihu, Bilibili, 36Kr, IT Home, GitHub Trending, Huxiu, SSPai, Juejin, V2EX, CSDN — all connected.

**How to use it?**

You tell Claude Code: "Show me today's trending topics."

Or: "Compile all AI programming related trends for today."

It simultaneously checks 36Kr, Zhihu, Bilibili, GitHub, Juejin, and more — filters out what's relevant to your domain, and hands you a consolidated report.

No memorizing commands. No learning syntax. Just tell it what you want in plain English (or plain Chinese), and it delivers.

**The architecture is dead simple:**

```
You speak → Claude Code → DailyHot Skill → localhost:6688 → DailyHot API (56+ platforms)
```

Under the hood, it uses the open-source DailyHot API (MIT license). I wrapped it as a Claude Code Skill so the AI understands your requests.

---

## What I Had in Mind When I Built This

The market doesn't lack "trend aggregation" tools. It doesn't lack "AI writing" tools. It doesn't lack "one-click publishing" tools.

**What it lacks is a trend research tool that's deeply integrated with AI and controllable through natural language.**

You don't need to open a dozen apps anymore.
You don't need to dig through each platform manually.
You don't need to copy-paste by hand anymore.

You just sit in front of Claude Code, say "what's happening in the AI world today," and the answer lands right in front of you.

It reminds me of something:

**"A developer's value isn't measured by how many lines of code you write — it's measured by how much time you save other people."**

If this tool saves a fellow content creator half an hour a day from "scrolling for trends" — then every line of code was worth it.

---

## How to Install

**Method 1: One-Sentence Agent Install (Recommended)**

Already reviewed and live on SkillHub. Copy this message and send it to your Claude Agent:

```text
Please check if SkillHub store is installed. If not,
install SkillHub store according to https://skillhub.cn/install/skillhub.md,
but only install the CLI, then install the dailyhot-skill skill.
If already installed, just install the dailyhot-skill skill directly.
```

The Agent will handle installation and configuration automatically.

**Method 2: One-Line Global Install**

```bash
npx skills add yqdaddy/dailyhot-skill --skill dailyhot-skill -a claude-code -g
```

**Install dependencies and start the service:**

```bash
cd ~/.claude/skills/dailyhot-skill
npm install && node scripts/start-server.mjs
```

Once the service is running, open Claude Code and just say "show me today's trends" — it'll know what you mean.

**Supports 56+ platforms** covering general news, tech & internet, media communities, earthquake alerts, and more.

Full documentation and platform list:

- **SkillHub**: https://skillhub.cn/skills/dailyhot-skill
- **GitHub**: https://github.com/yqdaddy/dailyhot-skill

:::callout tip
**Find this tool useful?** Give it a star on [SkillHub](https://skillhub.cn/skills/dailyhot-skill) so more people who need it can find it.
:::

---

## Information Asymmetry: The Most Expensive Resource Right Now

But not in the way you think — not "I know something you don't."

The real information asymmetry is **"I know it before you."**

The same trending topic — if you find it half an hour earlier than someone else, your article goes out half an hour earlier, and your traffic starts half an hour earlier.

**In the AI era, the barrier to writing is gone. But the barrier to choosing what to write about? Still very much alive.**

Whoever finds "worthwhile topics" faster wins this content race.

If you're still manually scrolling through a dozen apps every day to find topics —

**I suggest you give this Skill a try.**

What if you could save that half hour too?

Pretty much sums it up.

---

## About MaMa AI

MaMa AI — focused on making AI engineering actually work in practice.

In plain terms: helping developers do less busywork — **but don't expect AI to think for you. It only types for you.**

**Follow for more field-tested, battle-scarred guides.**

:::callout tip
**Found this useful?** Share it with a friend who's also struggling on the AI adoption journey.
:::