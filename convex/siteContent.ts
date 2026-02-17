import { query } from "./_generated/server";

export const getHeroContent = query({
  args: {},
  handler: async (ctx) => {
    return await ctx.db.query("heroContent").first();
  },
});

export const getAboutContent = query({
  args: {},
  handler: async (ctx) => {
    return await ctx.db.query("aboutContent").first();
  },
});

export const getSocialLinks = query({
  args: {},
  handler: async (ctx) => {
    return await ctx.db.query("socialLinks").collect();
  },
});
