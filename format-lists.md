# List Formatting Guide (Tier 2)

**Load:** Auto-loads when content contains procedures, steps, or collections
**Purpose:** How to build scannable, actionable lists

---

## When to Use Lists

Lists are the DEFAULT format for:

- **Procedures/steps** (numbered)
- **Collections of items** (bulleted)
- **Requirements/criteria** (bulleted)
- **Features/benefits** (bulleted)
- **Checklists** (bulleted with checkboxes)
- **Anything sequential or enumerable**

**Rule:** If content CAN be a list, it SHOULD be a list. Prose is fallback.

---

## List Types

### Numbered Lists
Use when **order matters:**
- Step-by-step procedures
- Rankings or priorities
- Sequential processes
- Troubleshooting in order of likelihood

### Bulleted Lists
Use when **order doesn't matter:**
- Features or benefits
- Requirements or criteria
- Examples or options
- Collections of related items

### Checklists
Use for **verification tasks:**
- Pre-service preparation
- DIY inspection steps
- Maintenance reminders

---

## List Structure Rules

### Length Limits
| Dimension | Limit | Reason |
|-----------|-------|--------|
| Items | 5-7 ideal | Cognitive load |
| Items | 10 max | Split if longer |
| Item length | 1-2 lines | Scannability |

### Lists Over 7 Items
If your list exceeds 7 items:
1. **Question necessity:** Do all items serve the search intent?
2. **Group into categories:** Create sub-lists under headings
3. **Prioritize:** Keep top 5-6, mention "additional options available"
4. **Split:** Create separate lists for different audiences

### Parallel Structure (CRITICAL)
All list items must follow the same grammatical pattern.

**Wrong:**
- Check the filter
- Thermostat settings should be verified
- Looking at the pilot light

**Right:**
- Check the filter
- Verify the thermostat settings
- Inspect the pilot light

**Also Right:**
- Dirty filter
- Incorrect thermostat settings
- Extinguished pilot light

---

## Punctuation Rules

### Complete Sentences
End with periods:
- Check your thermostat settings first.
- Replace the filter if it's visibly dirty.
- Call a technician if the problem persists.

### Fragments/Phrases
No periods:
- Dirty air filter
- Incorrect thermostat setting
- Tripped circuit breaker

### Mixed (Avoid)
Don't mix sentences and fragments in the same list. Choose one style.

---

## List Introductions

### Good Introductions
- "Check these common causes:" (short, direct)
- "You'll need:" (for supply lists)
- "Follow these steps:" (for procedures)

### Avoid
- "Here is a list of..." (redundant)
- "The following are..." (wordy)
- "Below you will find..." (filler)

### Colon Usage
Use a colon when the intro directly leads into the list:
- "Check these three things:" ✓
- "Common causes include:" ✓
- "Common causes of cold air." ✗ (period doesn't lead to list)

---

## Procedure Lists (Step-by-Step)

### Structure
1. **Action verb first** - Start each step with what to do
2. **One action per step** - Don't combine multiple actions
3. **Include expected result** - What should happen if correct
4. **Keep steps atomic** - Each step should be completable before moving on

### Example Format
```
1. Turn off your furnace at the thermostat.
2. Locate the air filter (usually in the return air duct or furnace cabinet).
3. Remove the old filter and check its condition.
4. If dirty, insert a new filter with the arrow pointing toward the furnace.
5. Turn the furnace back on and wait 15 minutes.
```

### Nested Steps
Use for sub-actions within a main step:
```
3. Check the pilot light:
   - Look through the viewing window on your furnace
   - The flame should be steady and blue
   - If yellow or flickering, the pilot needs adjustment
```

---

## Checklist Format

For DIY inspection or verification:

```markdown
## Quick DIY Checks

- [ ] Thermostat set to HEAT mode
- [ ] Temperature set above current room temp
- [ ] Air filter clean (can see light through it)
- [ ] All supply vents open
- [ ] Circuit breaker in ON position
```

---

## Common Patterns

### Troubleshooting List
```markdown
**Common Causes of [Problem]**

1. **Dirty air filter** - Restricts airflow, triggers safety shutoff
2. **Thermostat issues** - Wrong settings or dead batteries
3. **Pilot light out** - Gas furnaces only, easy DIY fix
4. **Tripped breaker** - Check electrical panel
5. **Clogged condensate line** - High-efficiency furnaces
```

### Feature/Benefit List
```markdown
**Benefits of Regular Maintenance**

- Fewer breakdowns during peak season
- Lower energy bills (10-15% savings)
- Extended equipment lifespan
- Maintained warranty coverage
- Better indoor air quality
```

### Requirements List
```markdown
**Before Your Service Appointment**

- Clear 3 feet around indoor and outdoor units
- Replace batteries in thermostat
- Note any error codes displayed
- List symptoms and when they started
- Secure pets in a separate room
```

---

## Examples

### Good: Procedure List
**Query:** "how to check furnace filter"

> **How to Check Your Furnace Filter**
>
> 1. Turn off your furnace at the thermostat.
> 2. Locate the filter slot (check the return air duct or furnace cabinet).
> 3. Slide out the filter and hold it up to a light.
> 4. If you can't see light through it, the filter needs replacing.
> 5. Insert the new filter with the arrow pointing toward the furnace.
> 6. Turn the furnace back on.
>
> Check your filter monthly during heating season.

**Why it works:**
- Action verbs first
- One action per step
- Expected result in step 4
- Brief follow-up adds value

---

### Good: Cause List (Limited to 5)
**Query:** "why is my furnace blowing cold air"

> **Most Common Causes**
>
> 1. **Dirty air filter** - Restricts airflow, triggers safety shutoff
> 2. **Thermostat set incorrectly** - Check mode and temperature
> 3. **Pilot light out** - Gas furnaces only
> 4. **Tripped limit switch** - Overheating protection
> 5. **Ignition failure** - Electronic ignition systems
>
> These five causes account for 90% of cold air complaints.

**Why it works:**
- Limited to 5 (not exhaustive)
- Brief explanation with each
- Acknowledges coverage percentage

---

### Bad: List Too Long
> **Possible Causes of Cold Air**
>
> 1. Dirty filter
> 2. Thermostat issues
> 3. Pilot light
> 4. Limit switch
> 5. Ignition failure
> 6. Flame sensor
> 7. Gas valve
> 8. Control board
> 9. Blower motor
> 10. Ductwork leaks
> 11. Oversized unit
> 12. Refrigerant leak

**Why it fails:**
- 12 items = cognitive overload
- Items 6-12 are rare or require professional diagnosis
- Doesn't match search intent (homeowner wants to fix it)

**Fix:** Keep top 5, add "For less common causes, contact a technician."

---

### Bad: Non-Parallel Structure
> **Before Your Service Visit**
>
> - Clear the area around your unit
> - You should write down any error codes
> - Making sure pets are secured
> - Have your warranty information available
> - The technician will need access to electrical panel

**Why it fails:**
- Mixed grammatical structures
- Some are actions, some are statements
- Inconsistent voice

**Fix:**
> - Clear the area around your unit
> - Write down any error codes
> - Secure pets in another room
> - Gather warranty information
> - Ensure access to electrical panel

---

## Checklist Before Publishing

- [ ] List has 5-7 items (10 max)
- [ ] All items follow parallel structure
- [ ] Numbered lists are for sequential/ordered content
- [ ] Bulleted lists are for unordered collections
- [ ] Each item is 1-2 lines max
- [ ] No single-item lists (use prose instead)
- [ ] Introduction is concise (no "here is a list of...")
- [ ] Punctuation is consistent (all periods or all none)
